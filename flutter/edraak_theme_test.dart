// Widget/unit tests for the Edraak theme.
// Place this file at test/edraak_theme_test.dart in your Flutter project.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edraak_app/edraak_theme.dart';

void main() {
  test('light theme uses the accessible action colour and white background', () {
    final theme = EdraakTheme.light();
    expect(theme.colorScheme.primary, EdraakColors.orange700);
    expect(theme.colorScheme.onPrimary, Colors.white);
    expect(theme.scaffoldBackgroundColor, Colors.white);
    expect(theme.brightness, Brightness.light);
  });

  test('dark theme uses the brand orange action colour on navy background', () {
    final theme = EdraakTheme.dark();
    expect(theme.colorScheme.primary, EdraakColors.orange500);
    expect(theme.colorScheme.onPrimary, EdraakColors.navy950);
    expect(theme.scaffoldBackgroundColor, EdraakColors.navy950);
    expect(theme.brightness, Brightness.dark);
  });

  test('typography uses the Thmanyah Sans family in both themes', () {
    for (final theme in [EdraakTheme.light(), EdraakTheme.dark()]) {
      expect(theme.textTheme.displayLarge?.fontFamily, EdraakTheme.fontFamily);
      expect(theme.textTheme.bodyLarge?.fontSize, 18);
      expect(theme.textTheme.headlineLarge?.fontWeight, FontWeight.w900);
    }
  });

  testWidgets('filled button uses the Edraak action colour', (tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: EdraakTheme.light(),
      home: Scaffold(
        body: FilledButton(onPressed: () {}, child: const Text('اطلب معاينة')),
      ),
    ));
    expect(find.text('اطلب معاينة'), findsOneWidget);
    // The button takes its fill from the colour scheme's primary colour.
    final scheme = Theme.of(tester.element(find.byType(FilledButton))).colorScheme;
    expect(scheme.primary, EdraakColors.orange700);
  });
}
