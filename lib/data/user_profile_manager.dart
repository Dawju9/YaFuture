import 'package:flutter/material.dart';

class UserProfileManager {
  static double? bmi;
  static Future<UserProfile?> getUserProfile() async {
    // Tutaj możesz umieścić logikę pobierania danych profilu użytkownika, np. z bazy danych lub z lokalnego pliku
    // Załóżmy, że tutaj pobieramy dane z bazy danych
    try {
      // Symulujemy opóźnienie pobierania danych (np. z bazy danych)
      await Future.delayed(const Duration(seconds: 2));
      
      // Zwracamy dane profilu użytkownika (możemy je odczytać z bazy danych lub z innego źródła)
      return UserProfile(
        name: 'John Doe',
        age: 30,
        height: 180,// Przykładowe dane profilu użytkownika
        weight: 80, // Przykładowe dane profilu użytkownika
      );
    } catch (error, stackTrace) {
      // Obsługujemy błędy podczas pobierania danych profilu użytkownika
      FlutterError.onError = (details) {
        FlutterError.presentError(details.copyWith(stack: stackTrace));
      };
      FlutterError.onError!(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'user_profile_manager library',
        context: ErrorDescription('during fetching user profile data'),
      ));
      return null;
    }
  }
  static void saveBMI(double bmiValue) {
    bmi = bmiValue;
  }
}

class UserProfile { // Model danych profilu użytkownika
  final String name; // Przykładowe dane profilu użytkownika
  final int age;
  final double height;
  final double weight;

  UserProfile({ // Konstruktor profilu użytkownika
    required this.name, // Przykładowe dane profilu użytkownika
    required this.age,
    required this.height,
    required this.weight,
  });
}

