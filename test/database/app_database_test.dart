import 'package:drift/drift.dart' hide isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/features/menu/data/drift_app_settings_repository.dart';
import 'package:noson/src/features/onboarding/data/drift_installation_repository.dart';
import 'package:noson/src/features/onboarding/data/installation_id_generator.dart';
import 'package:noson/src/features/onboarding/domain/installation_repository.dart';
import 'package:noson/src/shared/data/database/app_database.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

const _installationId = '00000000-0000-4000-8000-000000000001';
const _orderId = '00000000-0000-4000-8000-000000000002';
const _executionId = '00000000-0000-4000-8000-000000000003';
const _idempotencyKey = '00000000-0000-4000-8000-000000000004';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  group('설치 상태 초기화', () {
    test('Installation ID와 가상자금을 하나의 트랜잭션으로 한 번만 생성한다', () async {
      final repository = _repository(database, nowMicros: 1000000);

      final first = await repository.initialize();
      final second = await repository.initialize();

      expect(first.installationId, _installationId);
      expect(second.installationId, first.installationId);
      expect(first.portfolioGeneration, 1);
      expect(first.availableJpy, FixedDecimal.parse('1000000'));
      expect(first.reservedJpy, FixedDecimal.zero);
      expect(
        await database.select(database.appInstallations).get(),
        hasLength(1),
      );
      expect(await database.select(database.jpyBalances).get(), hasLength(1));
    });

    test('Installation ID가 유효하지 않으면 잔액을 포함해 모두 롤백한다', () async {
      final repository = DriftInstallationRepository(
        database,
        idGenerator: const _FixedIdGenerator('invalid'),
        clock: () => 1000000,
      );

      await expectLater(
        repository.initialize(),
        throwsA(isA<InvalidDataException>()),
      );

      expect(await database.select(database.appInstallations).get(), isEmpty);
      expect(await database.select(database.jpyBalances).get(), isEmpty);
    });

    test('온보딩 완료 상태를 같은 Installation에 보존한다', () async {
      final repository = _repository(database, nowMicros: 1000000);
      await repository.initialize();

      final completed = await repository.completeOnboarding();
      final reinitialized = await repository.initialize();
      final loaded = await repository.load();

      expect(completed.onboardingCompleted, isTrue);
      expect(reinitialized.onboardingCompleted, isTrue);
      expect(loaded?.onboardingCompleted, isTrue);
      expect(loaded?.installationId, _installationId);
      expect(
        await database.select(database.appInstallations).get(),
        hasLength(1),
      );
      expect(await database.select(database.jpyBalances).get(), hasLength(1));
    });
  });

  group('포트폴리오 리셋', () {
    test('미체결 주문이 있으면 어떤 금융 데이터도 변경하지 않는다', () async {
      final repository = _repository(database, nowMicros: 2000000);
      await repository.initialize();
      await _insertOrder(database, isTerminal: false);

      await expectLater(
        repository.resetPortfolio(),
        throwsA(isA<PendingOrdersBlockResetException>()),
      );

      final state = await repository.load();
      expect(state?.portfolioGeneration, 1);
      expect(state?.availableJpy, FixedDecimal.parse('1000000'));
      expect(await database.select(database.localOrders).get(), hasLength(1));
    });

    test('종료 주문과 자산을 지우고 ID와 설정을 유지한 채 새 세대를 시작한다', () async {
      var nowMicros = 1000000;
      final repository = DriftInstallationRepository(
        database,
        idGenerator: const _FixedIdGenerator(_installationId),
        clock: () => nowMicros,
      );
      final settings = DriftAppSettingsRepository(
        database,
        clock: () => nowMicros,
      );
      await repository.initialize();
      await repository.completeOnboarding();
      await settings.write(key: 'chart.period', value: '24h');
      await database
          .into(database.assetPositions)
          .insert(
            AssetPositionsCompanion.insert(
              symbol: 'BTC',
              quantity: FixedDecimal.parse('0.01'),
              totalCostBasis: FixedDecimal.parse('100000'),
              updatedAtMicros: nowMicros,
            ),
          );
      await _insertOrder(database, isTerminal: true);
      await database
          .into(database.tradeExecutions)
          .insert(
            TradeExecutionsCompanion.insert(
              id: _executionId,
              orderId: _orderId,
              liquidityRole: 'maker',
              price: FixedDecimal.parse('10000000'),
              quantity: FixedDecimal.parse('0.01'),
              grossAmount: FixedDecimal.parse('100000'),
              fee: FixedDecimal.parse('-10'),
              settlementAmount: FixedDecimal.parse('99990'),
              executedAtMicros: nowMicros,
            ),
          );
      nowMicros = 2000000;

      final reset = await repository.resetPortfolio();

      expect(reset.installationId, _installationId);
      expect(reset.onboardingCompleted, isTrue);
      expect(reset.portfolioGeneration, 2);
      expect(reset.availableJpy, FixedDecimal.parse('1000000'));
      expect(await settings.read('chart.period'), '24h');
      expect(await database.select(database.assetPositions).get(), isEmpty);
      expect(await database.select(database.localOrders).get(), isEmpty);
      expect(await database.select(database.tradeExecutions).get(), isEmpty);
    });
  });

  group('제약과 설정', () {
    test('지원하지 않는 종목과 주문 유형·가격 조합을 거부한다', () async {
      final repository = _repository(database, nowMicros: 1000000);
      await repository.initialize();

      await expectLater(
        database
            .into(database.assetPositions)
            .insert(
              AssetPositionsCompanion.insert(
                symbol: 'ADA',
                quantity: FixedDecimal.one,
                totalCostBasis: FixedDecimal.one,
                updatedAtMicros: 1000000,
              ),
            ),
        throwsA(isA<Exception>()),
      );
      await expectLater(
        database
            .into(database.localOrders)
            .insert(
              LocalOrdersCompanion.insert(
                id: _orderId,
                portfolioGeneration: 1,
                orderKind: 'market',
                side: 'buy',
                symbol: 'BTC',
                status: 'filled',
                isTerminal: const Value(true),
                requestedPrice: Value(FixedDecimal.one),
                requestedQuantity: FixedDecimal.one,
                idempotencyKey: _idempotencyKey,
                createdAtMicros: 1000000,
                updatedAtMicros: 1000000,
              ),
            ),
        throwsA(isA<Exception>()),
      );
    });

    test('DB의 잘못된 10진 문자열을 읽을 때 경계에서 거부한다', () async {
      final repository = _repository(database, nowMicros: 1000000);
      await repository.initialize();
      await database.customStatement(
        "UPDATE jpy_balances SET available = '1e3' WHERE id = 1",
      );

      await expectLater(
        database.select(database.jpyBalances).getSingle(),
        throwsA(isA<FormatException>()),
      );
    });

    test('범용 설정을 덮어쓰고 삭제한다', () async {
      var nowMicros = 1000000;
      final repository = DriftAppSettingsRepository(
        database,
        clock: () => nowMicros,
      );

      await repository.write(key: 'chart.period', value: '1h');
      nowMicros = 2000000;
      await repository.write(key: 'chart.period', value: '24h');

      expect(await repository.read('chart.period'), '24h');
      final row = await database.select(database.appSettings).getSingle();
      expect(row.updatedAtMicros, 2000000);

      await repository.remove('chart.period');
      expect(await repository.read('chart.period'), isNull);
    });
  });
}

DriftInstallationRepository _repository(
  AppDatabase database, {
  required int nowMicros,
}) => DriftInstallationRepository(
  database,
  idGenerator: const _FixedIdGenerator(_installationId),
  clock: () => nowMicros,
);

Future<void> _insertOrder(AppDatabase database, {required bool isTerminal}) =>
    database
        .into(database.localOrders)
        .insert(
          LocalOrdersCompanion.insert(
            id: _orderId,
            portfolioGeneration: 1,
            orderKind: 'limit',
            side: 'buy',
            symbol: 'BTC',
            status: isTerminal ? 'filled' : 'open',
            isTerminal: Value(isTerminal),
            requestedPrice: Value(FixedDecimal.parse('10000000')),
            requestedQuantity: FixedDecimal.parse('0.01'),
            reservedJpy: Value(FixedDecimal.parse('100050')),
            idempotencyKey: _idempotencyKey,
            createdAtMicros: 1000000,
            updatedAtMicros: 1000000,
          ),
        );

final class _FixedIdGenerator implements InstallationIdGenerator {
  const _FixedIdGenerator(this.value);

  final String value;

  @override
  String generate() => value;
}
