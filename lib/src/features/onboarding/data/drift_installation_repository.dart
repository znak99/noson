import 'package:drift/drift.dart';
import 'package:noson/src/features/onboarding/domain/installation_repository.dart';
import 'package:noson/src/features/onboarding/domain/installation_state.dart';
import 'package:noson/src/shared/data/database/app_database.dart';
import 'package:noson/src/shared/data/database/database_constants.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

import 'installation_id_generator.dart';

typedef UtcMicrosClock = int Function();

int systemUtcMicros() => DateTime.now().toUtc().microsecondsSinceEpoch;

final class DriftInstallationRepository implements InstallationRepository {
  DriftInstallationRepository(
    this._database, {
    InstallationIdGenerator? idGenerator,
    UtcMicrosClock? clock,
  }) : _idGenerator = idGenerator ?? SecureUuidV4Generator(),
       _clock = clock ?? systemUtcMicros;

  final AppDatabase _database;
  final InstallationIdGenerator _idGenerator;
  final UtcMicrosClock _clock;

  @override
  Future<InstallationState> initialize() => _database.transaction(() async {
    final existing = await _database
        .select(_database.appInstallations)
        .getSingleOrNull();
    if (existing != null) {
      return _stateFor(existing);
    }

    final nowMicros = _clock();
    if (nowMicros <= 0) {
      throw StateError('현재 시각은 0보다 큰 UTC 마이크로초여야 합니다.');
    }

    final installation = AppInstallationsCompanion.insert(
      installationId: _idGenerator.generate(),
      createdAtMicros: nowMicros,
    );
    await _database.into(_database.appInstallations).insert(installation);
    await _database
        .into(_database.jpyBalances)
        .insert(
          JpyBalancesCompanion.insert(
            available: Value(FixedDecimal.parse(initialVirtualJpyText)),
            reserved: Value(FixedDecimal.zero),
            updatedAtMicros: nowMicros,
          ),
        );

    final created = await _database
        .select(_database.appInstallations)
        .getSingle();
    return _stateFor(created);
  });

  @override
  Future<InstallationState?> load() => _database.transaction(() async {
    final installation = await _database
        .select(_database.appInstallations)
        .getSingleOrNull();
    return installation == null ? null : _stateFor(installation);
  });

  @override
  Future<InstallationState> completeOnboarding() =>
      _database.transaction(() async {
        final installation = await _requiredInstallation();
        await (_database.update(
          _database.appInstallations,
        )..where((row) => row.id.equals(installation.id))).write(
          const AppInstallationsCompanion(onboardingCompleted: Value(true)),
        );
        return _stateFor(installation.copyWith(onboardingCompleted: true));
      });

  @override
  Future<InstallationState> resetPortfolio() => _database.transaction(() async {
    final blockingOrder = await (_database.select(
      _database.localOrders,
    )..where((row) => row.isTerminal.equals(false))).getSingleOrNull();
    if (blockingOrder != null) {
      throw const PendingOrdersBlockResetException();
    }

    final installation = await _requiredInstallation();
    final nowMicros = _clock();
    if (nowMicros < installation.createdAtMicros) {
      throw StateError('리셋 시각은 앱 생성 시각보다 빠를 수 없습니다.');
    }

    await _database.delete(_database.localOrders).go();
    await _database.delete(_database.assetPositions).go();
    await (_database.update(
      _database.jpyBalances,
    )..where((row) => row.id.equals(1))).write(
      JpyBalancesCompanion(
        available: Value(FixedDecimal.parse(initialVirtualJpyText)),
        reserved: Value(FixedDecimal.zero),
        updatedAtMicros: Value(nowMicros),
      ),
    );

    final nextGeneration = installation.portfolioGeneration + 1;
    await (_database.update(
      _database.appInstallations,
    )..where((row) => row.id.equals(installation.id))).write(
      AppInstallationsCompanion(
        portfolioGeneration: Value(nextGeneration),
        lastResetAtMicros: Value(nowMicros),
      ),
    );

    return _stateFor(
      installation.copyWith(portfolioGeneration: nextGeneration),
    );
  });

  Future<AppInstallationRow> _requiredInstallation() async {
    final installation = await _database
        .select(_database.appInstallations)
        .getSingleOrNull();
    if (installation == null) {
      throw StateError('초기화되지 않은 앱 설치 상태입니다.');
    }
    return installation;
  }

  Future<InstallationState> _stateFor(AppInstallationRow installation) async {
    final balance = await _database
        .select(_database.jpyBalances)
        .getSingleOrNull();
    if (balance == null) {
      throw StateError('앱 설치 상태에 대응하는 JPY 잔액이 없습니다.');
    }
    return InstallationState(
      installationId: installation.installationId,
      createdAtMicros: installation.createdAtMicros,
      onboardingCompleted: installation.onboardingCompleted,
      portfolioGeneration: installation.portfolioGeneration,
      availableJpy: balance.available,
      reservedJpy: balance.reserved,
    );
  }
}
