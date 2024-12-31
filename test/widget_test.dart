import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ayagrubmi/main.dart';
//import 'package:ayagrubmi/screens/bmi_screen.dart';

void main() {
  testWidgets('Test kalkulatora BMI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Przejdź do ekranu kalkulatora BMI.
    await tester.tap(find.byKey(const ValueKey('bmi_button')));
    await tester.pumpAndSettle();

    // Wprowadź dane do kalkulatora.
    await tester.enterText(find.byKey(const ValueKey('height_field')), '180');
    await tester.enterText(find.byKey(const ValueKey('weight_field')), '80');
    await tester.pump();

    // Naciśnij przycisk oblicz.
    await tester.tap(find.byKey(const ValueKey('calculate_button')));
    await tester.pumpAndSettle();

    // Sprawdź, czy wynik jest wyświetlany poprawnie.
    expect(find.text('24.7'), findsOneWidget); // To wartość BMI dla wprowadzonych danych

    // Sprawdź, czy jest wyświetlana odpowiednia interpretacja wyniku.
    expect(find.text('Waga prawidłowa'), findsOneWidget); // To interpretacja dla wartości BMI 24.7
  });
}
