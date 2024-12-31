import 'package:ayagrubmi/modules/bmi_calculator.dart';

class BMILogic {
  final BMICalculator _calculator = BMICalculator();

  double calculateBMI(double weight, double height) {
    return _calculator.calculateBMI(weight, height);
  }

  String interpretBMI(double bmi) {
    return _calculator.interpretBMI(bmi);
  }
}
