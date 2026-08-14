import 'package:noson/src/trading/fixed_decimal.dart';

final class InstallationState {
  const InstallationState({
    required this.installationId,
    required this.createdAtMicros,
    required this.onboardingCompleted,
    required this.portfolioGeneration,
    required this.availableJpy,
    required this.reservedJpy,
  });

  final String installationId;
  final int createdAtMicros;
  final bool onboardingCompleted;
  final int portfolioGeneration;
  final FixedDecimal availableJpy;
  final FixedDecimal reservedJpy;
}
