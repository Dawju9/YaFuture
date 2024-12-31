import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ayagrubmi/main.dart';

/// Testuje działanie kalkulatora BMI w aplikacji Aya GruBMI.
void main() {
  // Testuje działanie kalkulatora BMI poprzez uruchomienie aplikacji i
  // symulowanie interakcji z ekranem kalkulatora BMI.
  testWidgets(
    'Test kalkulatora BMI',
    (WidgetTester tester) async {
      // Uruchamiamy aplikację, która zostanie załadowana na ekranie SplashScreen.
      await tester.pumpWidget(const MyApp());

      // Poczekaj, aż zostanie załadowany ekran SplashScreen.
      await tester.pumpAndSettle();

      // Sprawdzamy, czy znajduje się przycisk do przejścia do kalkulatora BMI.
      expect(
        find.byKey(const ValueKey('bmi_button')), 
        findsOneWidget,
        reason: 'Nie znaleziono przycisku do przejścia do kalkulatora BMI.',
      );

      // Kliknij przycisk, aby przejść do ekranu kalkulatora BMI.
      await tester.tap(find.byKey(const ValueKey('bmi_button')));
      await tester.pumpAndSettle();

      // Wprowadź dane do kalkulatora BMI.
      await tester.enterText(
        find.byKey(const ValueKey('height_field')), 
        '180',
      );
      await tester.enterText(
        find.byKey(const ValueKey('weight_field')), 
        '80',
      );
      await tester.pump();

      // Naciśnij przycisk oblicz.
      await tester.tap(find.byKey(const ValueKey('calculate_button')));
      await tester.pumpAndSettle();

      // Sprawdź, czy wyświetla się poprawny wynik BMI.
      expect(
        find.text('24.7'), 
        findsOneWidget, 
        reason: 'Nie wyświetla się poprawny wynik BMI.',
      );

      // Sprawdź, czy wyświetla się poprawna interpretacja wyniku.
      expect(
        find.text('Waga prawidłowa'), 
        findsOneWidget, 
        reason: 'Nie wyświetla się poprawna interpretacja wyniku.',
      );
    },
  );
}
