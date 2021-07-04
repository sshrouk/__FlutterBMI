import 'package:flutter/material.dart';
import 'package:flutter_app5/carditem.dart';
import 'package:flutter_app5/result.dart';
import 'package:flutter_app5/roundedBtn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calculate_brain.dart';
import 'constant.dart';

enum Gender { male, female }

class DMI extends StatefulWidget {
  @override
  _DMIState createState() => _DMIState();
}

class _DMIState extends State<DMI> {
  Color maleColor = activeCardItem;
  Color femaleColor = activeCardItem;
  Gender selectGender;
  int height = 120;
  int weight = 60;
  int age = 20;

  void upDateColor(int gender) {
    if (gender == 1) {
      if (maleColor == activeCardItem) {
        maleColor = inactiveCardItem;
        femaleColor = activeCardItem;
      } else {
        maleColor = activeCardItem;
      }
    } else if (gender == 2) {
      if (femaleColor == activeCardItem) {
        femaleColor = inactiveCardItem;
        maleColor = activeCardItem;
      } else {
        femaleColor = activeCardItem;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardItem(
                    color: selectGender == Gender.male
                        ? inactiveCardItem
                        : activeCardItem,
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    cardChild: buildCard(
                        icon: FontAwesomeIcons.mars, cardName: 'Male'),
                  ),
                ),
                Expanded(
                  child: CardItem(
                    color: selectGender == Gender.female
                        ? inactiveCardItem
                        : activeCardItem,
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    cardChild: buildCard(
                      icon: FontAwesomeIcons.venus,
                      cardName: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardItem(
              color: inactiveCardItem,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: labelTextStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: numStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  //scroll
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTickMarkColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0xFFEB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 20,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          height = value.round(); //qemt el scroll
                        });
                      },
                      max: 220,
                      min: 120,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardItem(
                    color: inactiveCardItem,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'weight',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CardItem(
                    color: inactiveCardItem,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: labelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: numStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedButton(
                              iconData: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundedButton(
                              iconData: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                CalculateBrain cal=CalculateBrain(height,weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Result(dmi: cal.calculateBMI(),dmiResult:cal.getResult(),advice:cal.getAdvice());
                }));
              },
              child: Container(
                height: bottomHeight,
                width: double.infinity,
                color: btnColor,
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: buttonTextStyle,
                  ),
                ),
              ),
          ),

        ],
      ),
    );
  }

  Widget buildCard({@required IconData icon, @required String cardName}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 75,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cardName,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
