import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const PageStorageKey('menu-list'),
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('このアプリについて'),
                subtitle: Text('暗号資産現物取引の無料シミュレーション'),
              ),
              Divider(height: 1),
              ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text('プライバシー'),
                subtitle: Text('公開前にご案内します'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
