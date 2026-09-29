import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
  });

  final int height;
  final int weight;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Bạn có cân nặng cao hơn mức bình thường. Hãy tập thể dục nhiều hơn.';
    } else if (_bmi >= 18.5) {
      return 'Bạn có cân nặng bình thường. Làm tốt lắm!';
    } else {
      return 'Bạn có cân nặng thấp hơn mức bình thường. Hãy ăn uống đầy đủ hơn.';
    }
  }
}