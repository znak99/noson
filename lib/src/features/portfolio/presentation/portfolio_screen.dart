import 'package:flutter/material.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('portfolio-list'),
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '仮想ポートフォリオ',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                const Text('初回設定後に仮想資産と損益を表示します。'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Card(
          child: ListTile(
            leading: Icon(Icons.receipt_long_outlined),
            title: Text('取引履歴'),
            subtitle: Text('まだシミュレーション取引はありません'),
          ),
        ),
      ],
    );
  }
}
