import 'dart:math';

class BmiCalculater {

  int weight;
  int height;
  double _bmi = 0.0;

  BmiCalculater(this.weight,this.height);

  String calculateBmi(){
    _bmi = weight/pow(height/100,2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(double.parse(calculateBmi()) >= 25){
      print(_bmi);
      return 'Overweight';
    }
    else if(double.parse(calculateBmi()) >= 18.5){
      print(_bmi);
      return 'Normal';
    }
    else{
      print(_bmi);
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if(double.parse(calculateBmi()) >= 25)
      return 'You have a higher than normal body weight. Try to exercise more.';
    else if(double.parse(calculateBmi()) >= 18.5)
      return 'You have normal body weight. Good job!';
    else
      return 'You have a lower than normal body weight. Try to eat more.';
  }
}