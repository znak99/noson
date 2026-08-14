import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/market/presentation/market_screen.dart';
import '../features/menu/presentation/menu_screen.dart';
import '../features/portfolio/presentation/portfolio_screen.dart';
import '../shared/presentation/simulation_notice.dart';

enum MainTab {
  market('銘柄'),
  portfolio('資産'),
  menu('メニュー');

  const MainTab(this.label);

  final String label;
}

final mainTabProvider = NotifierProvider<MainTabController, MainTab>(
  MainTabController.new,
);

class MainTabController extends Notifier<MainTab> {
  @override
  MainTab build() => MainTab.market;

  void select(MainTab tab) {
    state = tab;
  }
}

class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  static const _screens = <Widget>[
    MarketScreen(),
    PortfolioScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(mainTabProvider);

    return Scaffold(
      appBar: AppBar(title: Text(selectedTab.label)),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: SimulationNotice(),
            ),
            Expanded(
              child: IndexedStack(index: selectedTab.index, children: _screens),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab.index,
        onDestinationSelected: (index) {
          ref.read(mainTabProvider.notifier).select(MainTab.values[index]);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.show_chart_outlined),
            selectedIcon: Icon(Icons.show_chart),
            label: '銘柄',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: '資産',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_outlined),
            selectedIcon: Icon(Icons.menu),
            label: 'メニュー',
          ),
        ],
      ),
    );
  }
}
