import 'package:flutter/material.dart';

class HistoryDataScreen extends StatelessWidget {
  const HistoryDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historia wprowadzonych danych'),
      ),
      body: const Center(
        child: Text('Tutaj możesz wyświetlić historię wprowadzonych danych'),
      ),
    );
  }
}
