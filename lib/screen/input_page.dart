import 'package:bmi_calculator/components/result_button.dart';
import 'package:bmi_calculator/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/child_card.dart';
import '../components/resuable_card.dart';
import '../color_const.dart';
import '../components/RoundIcons.dart';
import '../screen/result_page.dart';
import 'package:bmi_calculator/bmi_calculater.dart';

enum GenderColor {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderColor genderColor = GenderColor.none;
  int height = 150;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                          genderColor == GenderColor.male
                              ? kReusableWidgetColor
                              : kUnselectedWidgetColor,
                          ChildCard(FontAwesomeIcons.mars, 'MALE'), () {
                        setState(() {
                          genderColor = GenderColor.male;
                        });
                      }),
                    ),
                    Expanded(
                      child: ReusableCard(
                        genderColor == GenderColor.female
                            ? kReusableWidgetColor
                            : kUnselectedWidgetColor,
                        ChildCard(FontAwesomeIcons.venus, 'FEMALE'),
                        () {
                          setState(() {
                            genderColor = GenderColor.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                    kReusableWidgetColor,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HEIGHT', style: kTextStyle),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(height.toString(),
                                    style: kBoldNumberStyle),
                                Text('cm', style: kTextStyle),
                              ]),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTickMarkColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 20),
                                overlayShape:
                                    RoundSliderOverlayShape(overlayRadius: 35)),
                            child: Slider(
                                min: 120,
                                max: 220,
                                value: height.roundToDouble(),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                  print(height.toString());
                                }),
                          ),
                        ]),
                    () {}),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        kReusableWidgetColor,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kTextStyle,
                            ),
                            Row(
                                textBaseline: TextBaseline.alphabetic,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    weight.toString(),
                                    style: kBoldNumberStyle,
                                  ),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(FontAwesomeIcons.plus, () {
                                  setState(() {
                                    weight++;
                                    print(weight);
                                  });
                                }),
                                SizedBox(width: 10),
                                RoundIconButton(FontAwesomeIcons.minus, () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        () {},
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                          kReusableWidgetColor,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: kTextStyle,
                              ),
                              Row(
                                  textBaseline: TextBaseline.alphabetic,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: kBoldNumberStyle,
                                    ),
                                  ]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(FontAwesomeIcons.plus, () {
                                    setState(() {
                                      age++;
                                    });
                                  }),
                                  SizedBox(width: 10),
                                  RoundIconButton(FontAwesomeIcons.minus, () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                                ],
                              ),
                            ],
                          ),
                          () {}),
                    ),
                  ],
                ),
              ),
              ResultButton(() {

               BmiCalculater bmiCalculater = BmiCalculater(weight, height);
                String interpretation = bmiCalculater.getInterpretation();
                String result = bmiCalculater.getResult();
                String bmi = bmiCalculater.calculateBmi();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ResultPage(bmi,result,interpretation)),
                );
              },'CALCULATE'),
            ],
          ),
        ),
      ),
    );
  }
}
