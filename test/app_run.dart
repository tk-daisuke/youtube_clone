import 'package:flutter_test/flutter_test.dart';

import 'package:appbar_custom/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


// スクリーンショットを作成
// flutter test --update-goldens
// テスト開始
// flutter test
Future<void> apprun(WidgetTester tester) async {
  await tester.pumpWidget(const ProviderScope(child: MyApp()));
}
