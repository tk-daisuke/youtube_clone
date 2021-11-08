import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:golden_toolkit/golden_toolkit.dart';

import 'item/device.dart';
import 'app_run.dart';
import 'model/test_model.dart';

// スクリーンショットを作成
// flutter test --update-goldens
// テスト開始
// flutter test

void main() {
  final model = TestModel();
  testGoldens('App Run', (WidgetTester tester) async {
    await apprun(tester);
    await multiScreenGolden(tester, 'app_run', devices: kDevices);
  });
  group('HomeScreen', () {
    testGoldens('app_bar', (tester) async {
      await apprun(tester);
      await model.searchOneWidget(tester, find.text('YouTube'));
      await model.tapEvent(tester, find.byIcon(Icons.cast));
      await model.searchOneWidget(tester, find.byIcon(Icons.live_tv));
      await multiScreenGolden(tester, 'showBottomSheetDialog',
          devices: kDevices);

      // // ctrl!.jumpTo(ctrl.position.maxScrollExtent);
      await tester.fling(
          find.byKey(
            const ValueKey('device_access'),
          ),
          const Offset(0.0, -4000.0),
          400);

      // await tester.pump(const Duration(milliseconds: 10));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await model.tapEvent(tester, find.byIcon(Icons.close));
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await model.searchZeroWidget(tester, find.byIcon(Icons.live_tv));
      await multiScreenGolden(tester, 'app_bar', devices: kDevices);
    });
    testGoldens('bottom_appbar', (tester) async {
      await apprun(tester);
      await model.searchOneWidget(tester, find.byIcon(Icons.home));
      await model.searchZeroWidget(tester, find.byIcon(Icons.home_outlined));
      await model.searchZeroWidget(tester, find.byIcon(Icons.explore));
      await multiScreenGolden(tester, 'bottom_appbar', devices: kDevices);
    });

    testGoldens('select chip', (tester) async {
      await apprun(tester);
      await model.searchOneWidget(tester, find.text('音楽'));
      await model.searchWidgetAndTextColor(
          tester, find.text('音楽'), Colors.white);
      await model.tapEvent(tester, find.text('音楽'));
      await model.searchWidgetAndTextColor(
          tester, find.text('音楽'), Colors.black);
      await multiScreenGolden(tester, 'select_chips', devices: kDevices);
    });
  });
}
