import 'dart:math';
//import 'package:fluttter/material.dart';
class BMICalculator {
  double calculateBMI(double weight, double height) {
    return weight / pow(height, 2);
  }

  String interpretBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Niedowaga';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Prawidłowa waga';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Nadwaga';
    } else {
      return 'Otyłość';
    }
  }
}
