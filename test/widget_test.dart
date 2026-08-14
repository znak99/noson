import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noson/src/app/noson_app.dart';
import 'package:noson/src/shared/presentation/simulation_notice.dart';

void main() {
  testWidgets('일본어 종목 탭과 모의투자 고지를 표시한다', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: NosonApp()));

    expect(find.text(SimulationNotice.message), findsOneWidget);
    expect(find.text('対応銘柄'), findsOneWidget);
    expect(find.text('BTC / JPY'), findsOneWidget);
    expect(find.text('Flutter Demo Home Page'), findsNothing);
    expect(find.byType(NavigationBar), findsOneWidget);
  });

  testWidgets('하단 탐색으로 자산과 메뉴 탭을 전환한다', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: NosonApp()));

    await tester.tap(find.text('資産'));
    await tester.pumpAndSettle();
    expect(find.text('仮想ポートフォリオ'), findsOneWidget);

    await tester.tap(find.text('メニュー'));
    await tester.pumpAndSettle();
    expect(find.text('このアプリについて'), findsOneWidget);
    expect(find.text('プライバシー'), findsOneWidget);
  });
}
