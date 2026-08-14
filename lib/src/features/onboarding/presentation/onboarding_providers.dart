import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/data/database/app_database.dart';
import '../data/drift_installation_repository.dart';
import '../domain/installation_repository.dart';
import '../domain/installation_state.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase.defaults();
  ref.onDispose(database.close);
  return database;
});

final installationRepositoryProvider = Provider<InstallationRepository>(
  (ref) => DriftInstallationRepository(ref.watch(appDatabaseProvider)),
);

final installationControllerProvider =
    AsyncNotifierProvider<InstallationController, InstallationState>(
      InstallationController.new,
    );

final class InstallationController extends AsyncNotifier<InstallationState> {
  @override
  Future<InstallationState> build() {
    return ref.watch(installationRepositoryProvider).initialize();
  }

  Future<void> completeOnboarding() async {
    if (state.isLoading) {
      return;
    }

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      ref.read(installationRepositoryProvider).completeOnboarding,
    );
  }

  void retry() {
    ref.invalidateSelf();
  }
}
