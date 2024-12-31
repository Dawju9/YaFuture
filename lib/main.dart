//import 'package:ayagrubmi/screens/dam_splash.dart';
import 'package:flutter/material.dart';

import 'package:ayagrubmi/screens/bmi_screen.dart';
// Importujemy plik kalkulatora BMI

import 'package:ayagrubmi/screens/home_page.dart';
// Importujemy plik strony głównej

import 'package:ayagrubmi/screens/profile_input_screen.dart';
// Importujemy plik profilu danych

import 'package:ayagrubmi/screens/profile_screen.dart';
// Importujemy plik profilu użytkownika

import 'package:ayagrubmi/screens/splash_screen.dart';
// Importujemy plik splash screen

// Komentarz dodany

/* Reszta z importów nie używana*/
// import 'package:ayagrubmi/modules/send_github_changelog.dart'; // Importujemy moduł send_github_changelog.dart
//import 'package:ayagrubmi/screens/profile_data_screen.dart'; // Komentarz został usunięty
//import 'package:ayagrubmi/screens/splash_screen.dart'; // Importujemy plik splash_screen.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GruBMI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Ustawienie SplashScreen jako początkowego ekranu
      home: const SplashScreen(),

      //home: const SplashScreen(),
      routes: {
        '/home': (context) => const HomePage(), // Trasa do ekranu głównego
        '/bmi': (context) => const BMIScreen(), // Trasa do kalkulatora BMI
        '/profil': (context) =>
            const ProfileScreen(), // Trasa do profilu użytkownika
        '/profileInput': (context) =>
            const ProfileInputScreen(), // Trasa do kalkulatora BMI
        // Dodaj inne trasy do innych ekranów tutaj...
      },
    );
  }
}
