// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lumina_app/core/router/app_router.dart';
import 'package:lumina_app/features/session/presentation/pages/session_page.dart';
import 'package:lumina_app/main.dart';

void main() {
  testWidgets('Home page displays correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const LuminaApp());
    await tester.pumpAndSettle();

    // Verify the app title is displayed.
    expect(find.text('Welcome to Lumina'), findsOneWidget);

    // Verify the tagline is displayed.
    expect(find.text('A calm, voice-first AI mental wellness companion.'),
        findsOneWidget);

    // Verify the Ask Lumina button exists.
    expect(find.text('Ask Lumina'), findsOneWidget);
  });

  testWidgets('HomePage widget renders correctly', (WidgetTester tester) async {
    // Test HomePage in isolation.
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('Welcome to Lumina'), findsOneWidget);
    expect(find.text('Ask Lumina'), findsOneWidget);
    expect(find.byType(OutlinedButton), findsOneWidget);
  });

  testWidgets('SessionPage widget renders correctly',
      (WidgetTester tester) async {
    // Test SessionPage in isolation.
    await tester.pumpWidget(
      const MaterialApp(
        home: SessionPage(),
      ),
    );

    expect(find.text('Chat with Lumina, your AI Wellness Companion!'),
        findsOneWidget);
    expect(find.text('Welcome to your safe space!'), findsOneWidget);
    expect(find.byIcon(Icons.psychology_outlined), findsOneWidget);
  });
}
