import 'package:drift/drift.dart';

import 'database_constants.dart';
import 'fixed_decimal_converter.dart';

@DataClassName('AppInstallationRow')
class AppInstallations extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get installationId =>
      text().withLength(min: 36, max: 36).unique()();
  IntColumn get createdAtMicros => integer()();
  BoolColumn get onboardingCompleted =>
      boolean().withDefault(const Constant(false))();
  IntColumn get portfolioGeneration =>
      integer().withDefault(const Constant(1))();
  IntColumn get lastResetAtMicros => integer().nullable()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (id = 1)',
    'CHECK (created_at_micros > 0)',
    'CHECK (portfolio_generation >= 1)',
    'CHECK (last_reset_at_micros IS NULL OR last_reset_at_micros >= created_at_micros)',
  ];

  @override
  bool get isStrict => true;
}

@DataClassName('AppSettingRow')
class AppSettings extends Table {
  TextColumn get key => text().withLength(min: 1, max: 100)();
  TextColumn get value => text()();
  IntColumn get updatedAtMicros => integer()();

  @override
  Set<Column<Object>> get primaryKey => {key};

  @override
  List<String> get customConstraints => ['CHECK (updated_at_micros > 0)'];

  @override
  bool get isStrict => true;
}

@DataClassName('JpyBalanceRow')
class JpyBalances extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  TextColumn get available => text()
      .withLength(min: 1, max: 64)
      .withDefault(const Constant(initialVirtualJpyText))
      .map(const FixedDecimalConverter())();
  TextColumn get reserved => text()
      .withLength(min: 1, max: 64)
      .withDefault(const Constant(zeroDecimalText))
      .map(const FixedDecimalConverter())();
  IntColumn get updatedAtMicros => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (id = 1)',
    'CHECK (updated_at_micros > 0)',
  ];

  @override
  bool get isStrict => true;
}

@DataClassName('AssetPositionRow')
class AssetPositions extends Table {
  TextColumn get symbol => text().withLength(min: 3, max: 4)();
  TextColumn get quantity =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get totalCostBasis =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get reservedQuantity => text()
      .withLength(min: 1, max: 64)
      .withDefault(const Constant(zeroDecimalText))
      .map(const FixedDecimalConverter())();
  IntColumn get updatedAtMicros => integer()();

  @override
  Set<Column<Object>> get primaryKey => {symbol};

  @override
  List<String> get customConstraints => [
    "CHECK (symbol IN ('BTC', 'ETH', 'XRP', 'SOL', 'DOGE'))",
    'CHECK (updated_at_micros > 0)',
  ];

  @override
  bool get isStrict => true;
}

@DataClassName('LocalOrderRow')
@TableIndex(
  name: 'local_orders_generation_status',
  columns: {#portfolioGeneration, #status},
)
class LocalOrders extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  IntColumn get installationKey => integer()
      .withDefault(const Constant(1))
      .references(AppInstallations, #id, onDelete: KeyAction.restrict)();
  IntColumn get portfolioGeneration => integer()();
  TextColumn get orderKind => text().withLength(min: 5, max: 6)();
  TextColumn get side => text().withLength(min: 3, max: 4)();
  TextColumn get symbol => text().withLength(min: 3, max: 4)();
  TextColumn get status => text().withLength(min: 1, max: 40)();
  BoolColumn get isTerminal => boolean().withDefault(const Constant(false))();
  TextColumn get requestedPrice => text()
      .withLength(min: 1, max: 64)
      .map(const FixedDecimalConverter())
      .nullable()();
  TextColumn get requestedQuantity =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get reservedJpy => text()
      .withLength(min: 1, max: 64)
      .withDefault(const Constant(zeroDecimalText))
      .map(const FixedDecimalConverter())();
  TextColumn get reservedQuantity => text()
      .withLength(min: 1, max: 64)
      .withDefault(const Constant(zeroDecimalText))
      .map(const FixedDecimalConverter())();
  TextColumn get serverOrderId => text().nullable().unique()();
  TextColumn get idempotencyKey =>
      text().withLength(min: 36, max: 36).unique()();
  IntColumn get createdAtMicros => integer()();
  IntColumn get updatedAtMicros => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    'CHECK (installation_key = 1)',
    'CHECK (portfolio_generation >= 1)',
    "CHECK (order_kind IN ('market', 'limit'))",
    "CHECK (side IN ('buy', 'sell'))",
    "CHECK (symbol IN ('BTC', 'ETH', 'XRP', 'SOL', 'DOGE'))",
    "CHECK ((order_kind = 'market' AND requested_price IS NULL) OR (order_kind = 'limit' AND requested_price IS NOT NULL))",
    'CHECK (created_at_micros > 0)',
    'CHECK (updated_at_micros >= created_at_micros)',
  ];

  @override
  bool get isStrict => true;
}

@DataClassName('TradeExecutionRow')
@TableIndex(name: 'trade_executions_time', columns: {#executedAtMicros})
class TradeExecutions extends Table {
  TextColumn get id => text().withLength(min: 36, max: 36)();
  TextColumn get orderId => text().unique().references(
    LocalOrders,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get liquidityRole => text().withLength(min: 5, max: 5)();
  TextColumn get price =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get quantity =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get grossAmount =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get fee =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  TextColumn get settlementAmount =>
      text().withLength(min: 1, max: 64).map(const FixedDecimalConverter())();
  IntColumn get executedAtMicros => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
    "CHECK (liquidity_role IN ('maker', 'taker'))",
    'CHECK (executed_at_micros > 0)',
  ];

  @override
  bool get isStrict => true;
}
