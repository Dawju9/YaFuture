import 'package:flutter/material.dart';

class ProfileInputScreen extends StatelessWidget {
  const ProfileInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wprowadź dane profilu'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tutaj możesz wprowadzić dane dla nowego profilu użytkownika'),
            // Dodaj pola do wprowadzania danych profilu
          ],
        ),
      ),
    );
  }
}
