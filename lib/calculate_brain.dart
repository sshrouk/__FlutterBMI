import 'dart:math';

class CalculateBrain {
  int height, weight;
  double _dmi;

  CalculateBrain(this.height, this.weight);

  String calculateBMI() {
    _dmi = weight / pow((height / 100), 2);
    return _dmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_dmi >= 25) {
      return "Over Weight";
    } else if (_dmi > 28.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  String getAdvice() {
    if (_dmi >= 25) {
      return "You have higher than normal body weight ,Try to exercise more";
    } else if (_dmi > 28.5) {
      return "You have  normal body weight ,good job^^";
    } else {
      return "Your BMI result is Quite Low ,You should eat more.";
    }
  }
}
