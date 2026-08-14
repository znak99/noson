import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/app/noson_app.dart';
import 'package:noson/src/features/onboarding/data/drift_installation_repository.dart';
import 'package:noson/src/features/onboarding/data/installation_id_generator.dart';
import 'package:noson/src/features/onboarding/domain/installation_repository.dart';
import 'package:noson/src/features/onboarding/domain/installation_state.dart';
import 'package:noson/src/features/onboarding/presentation/onboarding_providers.dart';
import 'package:noson/src/shared/data/database/app_database.dart';
import 'package:noson/src/shared/presentation/simulation_notice.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  testWidgets('최초 실행에서 일본어 고지 후 가상자금을 한 번만 지급한다', (tester) async {
    await _pumpApp(tester, database);

    expect(find.text('ノー損へようこそ'), findsOneWidget);
    expect(
      find.text('このアプリはシミュレーションです。実際の暗号資産の売買・入出金は行われません。'),
      findsOneWidget,
    );
    expect(find.text('表示される資産・利益・損失は、すべて仮想データです。'), findsOneWidget);
    expect(find.text('投資助言、銘柄の推奨、利益の保証は行いません。'), findsOneWidget);
    expect(find.text('最初に仮想資金 ¥1,000,000 を用意します。'), findsOneWidget);

    await tester.tap(find.text('仮想取引を始める'));
    await tester.pumpAndSettle();

    expect(find.text('対応銘柄'), findsOneWidget);
    final installations = await database
        .select(database.appInstallations)
        .get();
    final balances = await database.select(database.jpyBalances).get();
    expect(installations, hasLength(1));
    expect(installations.single.onboardingCompleted, isTrue);
    expect(balances, hasLength(1));
    expect(balances.single.available, FixedDecimal.parse('1000000'));

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
    await _pumpApp(tester, database);

    expect(find.text('ノー損へようこそ'), findsNothing);
    expect(find.text('対応銘柄'), findsOneWidget);
    expect(
      await database.select(database.appInstallations).get(),
      hasLength(1),
    );
    expect(await database.select(database.jpyBalances).get(), hasLength(1));
  });

  testWidgets('초기화 실패를 알리고 재시도하면 온보딩으로 복구한다', (tester) async {
    final delegate = DriftInstallationRepository(
      database,
      idGenerator: const _FixedInstallationIdGenerator(),
      clock: () => 1000000,
    );
    final repository = _FailOnceInstallationRepository(delegate);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          installationRepositoryProvider.overrideWithValue(repository),
        ],
        child: const NosonApp(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('初期設定を完了できませんでした。'), findsOneWidget);
    await tester.tap(find.text('もう一度試す'));
    await tester.pumpAndSettle();

    expect(find.text('ノー損へようこそ'), findsOneWidget);
    expect(repository.initializeCalls, 2);
  });

  testWidgets('일본어 종목 탭과 모의투자 고지를 표시한다', (tester) async {
    await _completeOnboarding(database);
    await _pumpApp(tester, database);

    expect(find.text(SimulationNotice.message), findsOneWidget);
    expect(find.text('対応銘柄'), findsOneWidget);
    expect(find.text('BTC / JPY'), findsOneWidget);
    expect(find.text('Flutter Demo Home Page'), findsNothing);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('하단 탐색으로 자산과 메뉴 탭을 전환한다', (tester) async {
    await _completeOnboarding(database);
    await _pumpApp(tester, database);

    await tester.tap(find.text('資産'));
    await tester.pumpAndSettle();
    expect(find.text('仮想ポートフォリオ'), findsOneWidget);

    await tester.tap(find.text('メニュー'));
    await tester.pumpAndSettle();
    expect(find.text('このアプリについて'), findsOneWidget);
    expect(find.text('プライバシー'), findsOneWidget);
  });
}

Future<void> _pumpApp(WidgetTester tester, AppDatabase database) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(database)],
      child: const NosonApp(),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> _completeOnboarding(AppDatabase database) async {
  final repository = DriftInstallationRepository(
    database,
    idGenerator: const _FixedInstallationIdGenerator(),
    clock: () => 1000000,
  );
  await repository.initialize();
  await repository.completeOnboarding();
}

final class _FixedInstallationIdGenerator implements InstallationIdGenerator {
  const _FixedInstallationIdGenerator();

  @override
  String generate() => '00000000-0000-4000-8000-000000000001';
}

final class _FailOnceInstallationRepository implements InstallationRepository {
  _FailOnceInstallationRepository(this._delegate);

  final InstallationRepository _delegate;
  int initializeCalls = 0;

  @override
  Future<InstallationState> initialize() {
    initializeCalls += 1;
    if (initializeCalls == 1) {
      return Future.error(StateError('의도한 최초 초기화 실패'));
    }
    return _delegate.initialize();
  }

  @override
  Future<InstallationState?> load() => _delegate.load();

  @override
  Future<InstallationState> completeOnboarding() =>
      _delegate.completeOnboarding();

  @override
  Future<InstallationState> resetPortfolio() => _delegate.resetPortfolio();
}
