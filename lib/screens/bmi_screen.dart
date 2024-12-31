import 'package:flutter/material.dart';
import 'package:ayagrubmi/logic/bmi_logic.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final BMILogic _bmiLogic = BMILogic();
  double _weight = 0;
  double _height = 0;
  double _bmiResult = 0;
  String _bmiInterpretation = '';

  void _calculateBMI() {
    setState(() {
      _bmiResult = _bmiLogic.calculateBMI(_weight, _height);
      _bmiInterpretation = _bmiLogic.interpretBMI(_bmiResult);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Waga (kg)'),
              onChanged: (value) =>
                  setState(() => _weight = double.tryParse(value) ?? 0),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Wzrost (m)'),
              onChanged: (value) =>
                  setState(() => _height = double.tryParse(value) ?? 0),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _calculateBMI(),
              child: const Text('Oblicz BMI'),
            ),
            const SizedBox(height: 20),
            Text('Wynik BMI: $_bmiResult'),
            Text('Interpretacja: $_bmiInterpretation'),
          ],
        ),
      ),
    );
  }
}
