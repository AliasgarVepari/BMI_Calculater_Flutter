import 'package:flutter/material.dart';
import 'package:bmi_calculator/color_const.dart';

class ResultButton extends StatelessWidget {
  ResultButton(this.onPressed, this.buttonContent);

  final VoidCallback? onPressed;
  var buttonContent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomWidgetColor,
        width: double.infinity,
        height: kBottomWidgetHeight,
        child: Center(
          child: Text(
            buttonContent,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
