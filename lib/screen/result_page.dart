import 'package:bmi_calculator/color_const.dart';
import 'package:bmi_calculator/components/resuable_card.dart';
import 'package:bmi_calculator/components/result_button.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/color_const.dart';

class ResultPage extends StatelessWidget {

  final String Bmi;
  final String Interpretation;
  final String BmiResult;
  const ResultPage(this.Bmi,this.BmiResult,this.Interpretation);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: ReusableCard(
                  kReusableWidgetColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        BmiResult,
                        style: kResultStyle,
                      ),
                      Text(
                        Bmi,
                        style: kLargeNumberStyle,
                      ),
                      Text(Interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle),
                    ],
                  ),
                  () {}),),
          ResultButton(() {Navigator.pop(context);},'Re-Calculate')
        ],
      ),
    );
  }
}
