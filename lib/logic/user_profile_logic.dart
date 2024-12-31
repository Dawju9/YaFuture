import 'package:ayagrubmi/data/user_profile_manager.dart';
import 'package:flutter/material.dart'; // Importujemy manager profilu użytkownika

class UserProfileLogic {
  // Metoda do pobierania danych profilu użytkownika
  static Future<UserProfile?> getUserProfile() async {
    try {
      // Wywołujemy metodę z managera profilu użytkownika
      return await UserProfileManager.getUserProfile();
    } catch (error, stackTrace) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: error,
        stack: stackTrace,
        library: 'user_profile_manager library',
        context: ErrorDescription('during fetching user profile data'),
      ));
      //print('Wystąpił błąd podczas pobierania danych profilu użytkownika: $error');
     // print('Stack: $stackTrace');
      return null;
    }
  }

  // Metoda do zapisywania danych profilu użytkownika
  static void saveBMI(double bmiValue) {
    // Wywołujemy metodę z managera profilu użytkownika
    UserProfileManager.saveBMI(bmiValue);
  }
}
