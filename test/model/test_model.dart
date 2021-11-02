import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestModel {
  Future<void> searchOneWidget(WidgetTester tester, Finder finders) async {
    expect(finders, findsOneWidget);
  }

  Future<void> searchZeroWidget(WidgetTester tester, Finder finders) async {
    expect(finders, findsNothing);
  }

  Future<void> searchWidgetAndTextColor(
      WidgetTester tester, Finder finders, Color textColor) async {
    expect(((tester.firstWidget(finders) as Text).style)!.color, textColor);
  }

  Future<void> tapEvent(WidgetTester tester, Finder finders) async {
    await tester.tap(finders);
    await tester.pump();
  }
}
