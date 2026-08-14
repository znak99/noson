import 'package:noson/src/features/menu/domain/app_settings_repository.dart';
import 'package:noson/src/shared/data/database/app_database.dart';

typedef SettingsUtcMicrosClock = int Function();

int settingsSystemUtcMicros() => DateTime.now().toUtc().microsecondsSinceEpoch;

final class DriftAppSettingsRepository implements AppSettingsRepository {
  DriftAppSettingsRepository(this._database, {SettingsUtcMicrosClock? clock})
    : _clock = clock ?? settingsSystemUtcMicros;

  final AppDatabase _database;
  final SettingsUtcMicrosClock _clock;

  @override
  Future<String?> read(String key) async {
    _validateKey(key);
    final row = await (_database.select(
      _database.appSettings,
    )..where((setting) => setting.key.equals(key))).getSingleOrNull();
    return row?.value;
  }

  @override
  Future<void> write({required String key, required String value}) async {
    _validateKey(key);
    final nowMicros = _clock();
    if (nowMicros <= 0) {
      throw StateError('설정 갱신 시각은 0보다 커야 합니다.');
    }
    await _database
        .into(_database.appSettings)
        .insertOnConflictUpdate(
          AppSettingsCompanion.insert(
            key: key,
            value: value,
            updatedAtMicros: nowMicros,
          ),
        );
  }

  @override
  Future<void> remove(String key) async {
    _validateKey(key);
    await (_database.delete(
      _database.appSettings,
    )..where((setting) => setting.key.equals(key))).go();
  }

  void _validateKey(String key) {
    if (key.isEmpty || key.length > 100) {
      throw ArgumentError.value(key, 'key', '설정 키는 1자 이상 100자 이하여야 합니다.');
    }
  }
}
