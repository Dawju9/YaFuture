

import 'package:flutter/material.dart';
import 'package:ayagrubmi/screens/tutorial_screen.dart';
//import 'package:ayagrubmi/screens/bmi_screen.dart'; // Importujemy plik kalkulatora BMI
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('GruBMI', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
            Text('Wykreślająca BMI', style: TextStyle(fontSize: 14, color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: 20),],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Witaj w aplikacji!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TutorialScreen()),
                );
              },
              child: const Text('Rozpocznij samouczek'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bmi'); // Przekierowanie do kalkulatora BMI
              },
              child: const Text('Kalkulator BMI'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profil'); // Przekierowanie do kalkulatora BMI
              },
              child: const Text('Pokaż profil'),
            ),
            // Dodaj inne przyciski do nawigacji do innych ekranów tutaj...
          ],
        ),
      ),
    );
  }
}


/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('grubmni'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Witaj w aplikacji!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorialScreen()),
                );
              },
              child: const Text('Rozpocznij samouczek'),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:ayagrubmi/screens/tutorial_screen.dart';
import 'package:ayagrubmi/screens/bmi_screen.dart'; // Importujemy plik kalkulatora BMI

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('grubmni'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Witaj w aplikacji!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TutorialScreen()),
                );
              },
              child: const Text('Rozpocznij samouczek'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bmi'); // Przekierowanie do kalkulatora BMI
              },
              child: const Text('Kalkulator BMI'),
            ),
            // Dodaj inne przyciski do nawigacji do innych ekranów tutaj...
          ],
        ),
      ),
    );
  }
}
*/