import 'package:flutter/material.dart';

import 'carditem.dart';
import 'constant.dart';

class Result extends StatelessWidget {
  final String dmi, dmiResult, advice;

  Result({
    this.dmi,
    this.dmiResult,
    this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardItem(
              color: inactiveCardItem,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$dmiResult',
                    style: resultTextStyle,
                  ),
                  Text(
                    '$dmi',
                    style: bMITextStyle,
                  ),
                  Text(
                    '$advice',
                    textAlign: TextAlign.center,
                    style: bodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: bottomHeight,
              width: double.infinity,
              color: btnColor,
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: buttonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
