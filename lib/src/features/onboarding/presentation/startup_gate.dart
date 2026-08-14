import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/main_shell.dart';
import 'onboarding_providers.dart';
import 'onboarding_screen.dart';

class StartupGate extends ConsumerWidget {
  const StartupGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final installation = ref.watch(installationControllerProvider);

    return installation.when(
      data: (state) => state.onboardingCompleted
          ? const MainShell()
          : const OnboardingScreen(),
      loading: () => const _StartupLoadingScreen(),
      error: (_, _) => const _StartupErrorScreen(),
    );
  }
}

class _StartupLoadingScreen extends StatelessWidget {
  const _StartupLoadingScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('準備しています…'),
            ],
          ),
        ),
      ),
    );
  }
}

class _StartupErrorScreen extends ConsumerWidget {
  const _StartupErrorScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 48),
                const SizedBox(height: 16),
                const Text('初期設定を完了できませんでした。', textAlign: TextAlign.center),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () =>
                      ref.read(installationControllerProvider.notifier).retry(),
                  child: const Text('もう一度試す'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
