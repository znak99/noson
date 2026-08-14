import 'package:drift/drift.dart';
import 'package:noson/src/trading/fixed_decimal.dart';

/// SQLite의 TEXT 경계에서 12자리 고정소수점 형식을 강제한다.
final class FixedDecimalConverter extends TypeConverter<FixedDecimal, String> {
  const FixedDecimalConverter();

  @override
  FixedDecimal fromSql(String fromDb) => FixedDecimal.parse(fromDb);

  @override
  String toSql(FixedDecimal value) => value.toString();
}
