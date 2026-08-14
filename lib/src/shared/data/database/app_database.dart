import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

import 'database_constants.dart';
import 'fixed_decimal_converter.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    AppInstallations,
    AppSettings,
    JpyBalances,
    AssetPositions,
    LocalOrders,
    TradeExecutions,
  ],
)
final class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.defaults() : super(driftDatabase(name: 'noson'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    onUpgrade: (migrator, from, to) async {
      throw StateError('지원하지 않는 데이터베이스 마이그레이션입니다: $from -> $to');
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
