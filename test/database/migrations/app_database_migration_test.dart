import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/shared/data/database/app_database.dart';

import 'generated/schema.dart';

void main() {
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  test('스키마 버전 1 스냅샷이 현재 데이터베이스와 일치한다', () async {
    final connection = await verifier.startAt(1);
    final database = AppDatabase(connection);

    await verifier.migrateAndValidate(database, 1);
    await database.close();
  });
}
