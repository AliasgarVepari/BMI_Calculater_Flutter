import 'package:bmi_calculator/color_const.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.iconData, this.onTap);

  final VoidCallback? onTap;
  IconData iconData;

  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
      onPressed: onTap,
      fillColor: kUnselectedWidgetColor,
      //Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      child: Icon(iconData, color: Colors.white),
    );
  }
}