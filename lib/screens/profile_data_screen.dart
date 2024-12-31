import 'package:flutter/material.dart';

class ProfileDataScreen extends StatelessWidget {
  const ProfileDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dodaj nowy profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tutaj możesz dodać nowy profil użytkownika'),
            ElevatedButton(
              onPressed: () {
                // Przejście do ekranu wprowadzania danych profilu
                Navigator.pushNamed(context, '/profileInput');
              },
              child: const Text('Dodaj profil'),
            ),
          ],
        ),
      ),
    );
  }
}
