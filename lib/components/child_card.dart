import 'package:flutter/material.dart';
import '../color_const.dart';

class ChildCard extends StatelessWidget {

  final IconData iconData;
  final text;

  ChildCard(@required this.iconData, this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: kIconHeight,
        ),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(text, style: kTextStyle),
      ],
    );
  }
}
