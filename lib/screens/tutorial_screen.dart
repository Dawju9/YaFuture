import 'package:flutter/material.dart';
//import 'package:ayagrubmi/screens/bmi_screen.dart'; // Importujemy plik kalkulatora BMI

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key }) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int _step = 1;

  void _nextStep() {
    setState(() {
      _step++;
    });
  }

  void _skipTutorial() {
    // Tutaj możesz dodać logikę, która przechodzi bezpośrednio do ekranu kalkulatora BMI
    Navigator.pushReplacementNamed(context, '/bmi');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Samouczek'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Witaj w samouczku!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            _buildTutorialStep(_step),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _step < 3 ? _nextStep : _skipTutorial,
              child: Text(_step < 3 ? 'Następny krok' : 'Pomiń samouczek'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorialStep(int step) {
    switch (step) {
      case 1:
        return const Text(
          'Krok 1: Aby rozpocząć korzystanie z kalkulatora BMI, przejdź do ekranu kalkulatora BMI.',
          textAlign: TextAlign.center,
        );
      case 2:
        return const Text(
          'Krok 2: Wprowadź swoje dane, aby obliczyć BMI na ekranie kalkulatora.',
          textAlign: TextAlign.center,
        );
      case 3:
        return const Text(
          'Krok 3: Otrzymasz wynik swojego BMI oraz interpretację wyniku.',
          textAlign: TextAlign.center,
        );
      default:
        return Container();
    }
  }
}
