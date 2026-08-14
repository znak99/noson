abstract interface class AppSettingsRepository {
  Future<String?> read(String key);

  Future<void> write({required String key, required String value});

  Future<void> remove(String key);
}
