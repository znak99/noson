import 'installation_state.dart';

abstract interface class InstallationRepository {
  Future<InstallationState> initialize();

  Future<InstallationState?> load();

  Future<InstallationState> completeOnboarding();

  Future<InstallationState> resetPortfolio();
}

final class PendingOrdersBlockResetException implements Exception {
  const PendingOrdersBlockResetException();

  @override
  String toString() => '미체결 주문의 취소와 동기화가 끝나지 않아 리셋할 수 없습니다.';
}
