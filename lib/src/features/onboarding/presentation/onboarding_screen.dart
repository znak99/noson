import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'onboarding_providers.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaving = ref.watch(
      installationControllerProvider.select((value) => value.isLoading),
    );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.query_stats, size: 64),
                  const SizedBox(height: 24),
                  Text(
                    'ノー損へようこそ',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '仮想資金で暗号資産の取引を体験できます',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 32),
                  const _NoticeCard(
                    icon: Icons.info_outline,
                    text: 'このアプリはシミュレーションです。実際の暗号資産の売買・入出金は行われません。',
                  ),
                  const SizedBox(height: 12),
                  const _NoticeCard(
                    icon: Icons.account_balance_wallet_outlined,
                    text: '表示される資産・利益・損失は、すべて仮想データです。',
                  ),
                  const SizedBox(height: 12),
                  const _NoticeCard(
                    icon: Icons.block_outlined,
                    text: '投資助言、銘柄の推奨、利益の保証は行いません。',
                  ),
                  const SizedBox(height: 28),
                  Text(
                    '最初に仮想資金 ¥1,000,000 を用意します。',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: isSaving
                        ? null
                        : () => ref
                              .read(installationControllerProvider.notifier)
                              .completeOnboarding(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: isSaving
                          ? const SizedBox.square(
                              dimension: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('仮想取引を始める'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NoticeCard extends StatelessWidget {
  const _NoticeCard({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 12),
            Expanded(child: Text(text)),
          ],
        ),
      ),
    );
  }
}
