import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final double height;
  final int weight;

  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 25 && _bmi >= 18.5) {
      return 'Normal';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Overweight';
    } else if (_bmi >= 30) {
      return 'Obese';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi < 25 && _bmi >= 18.5) {
      return 'Your body weight is Normal. Good job!';
    } else if (_bmi >= 25 && _bmi < 30) {
      return 'Your body weight is higher than normal. Exercise more!';
    } else if (_bmi >= 30) {
      return 'WOW! Only God can help you.';
    } else {
      return 'Your body weight is lower than normal. Eat more';
    }
  }
}
