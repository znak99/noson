import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  static const _assets = [
    ('BTC', 'Bitcoin'),
    ('ETH', 'Ethereum'),
    ('XRP', 'XRP'),
    ('SOL', 'Solana'),
    ('DOGE', 'Dogecoin'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('market-list'),
      padding: const EdgeInsets.all(16),
      children: [
        Text('対応銘柄', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        Text(
          '実際の市場データを利用した表示を準備しています。',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 16),
        for (final asset in _assets) ...[
          Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(asset.$1.substring(0, 1))),
              title: Text(asset.$2),
              subtitle: Text('${asset.$1} / JPY'),
              trailing: const Chip(label: Text('準備中')),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}
