import 'package:flutter_test/flutter_test.dart';
import 'package:ayagrubmi/main.dart';

void main() {
  testWidgets('Main app renders SplashScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that SplashScreen is rendered.
    expect(find.text('SplashScreen'), findsOneWidget);
  });

  // Dodaj więcej testów w miarę potrzeby...
}
