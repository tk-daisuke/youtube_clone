import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_toolkit/golden_toolkit.dart';

import 'item/device.dart';
import 'app_run.dart';

// スクリーンショットを作成
// flutter test --update-goldens
// テスト開始
// flutter test
Future<void> searchOneWidget(WidgetTester tester, Finder finders) async {
  expect(finders, findsOneWidget);
}

Future<void> searchWidgetAndTextColor(
    WidgetTester tester, Finder finders, Color textColor) async {
  expect(((tester.firstWidget(finders) as Text).style)!.color, textColor);
}

Future<void> tapEvent(WidgetTester tester, Finder finders) async {
  await tester.tap(finders);
  await tester.pump();
}

void main() {
  testGoldens('App Run', (WidgetTester tester) async {
    await apprun(tester);
    await multiScreenGolden(tester, 'app_run', devices: kDevices);
  });
  testGoldens('Select Chip', (tester) async {
    await apprun(tester);
    await searchOneWidget(tester, find.text('音楽'));
    await searchWidgetAndTextColor(tester, find.text('音楽'), Colors.white);
    await tapEvent(tester, find.text('音楽'));
    await searchWidgetAndTextColor(tester, find.text('音楽'), Colors.black);
    await multiScreenGolden(tester, 'select_chips', devices: kDevices);
  });

}

// // Verify that our counter starts at 0.
// expect(find.text('0'), findsOneWidget);
// expect(find.text('1'), findsNothing);

// // Tap the '+' icon and trigger a frame.

// // Verify that our counter has incremented.
// expect(find.text('0'), findsNothing);
// expect(find.text('1'), findsOneWidget);
