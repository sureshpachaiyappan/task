// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:task/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the ListScreen displays the app bar title
    expect(find.text('Business List'), findsOneWidget);

    // Verify that the ListScreen displays a list of items
    expect(find.byType(ListTile), findsNWidgets(19));

    // Verify that a specific item is present in the list
    expect(find.text('Item 0'), findsOneWidget);
    expect(find.text('Item 19'), findsOneWidget);
  });
}
