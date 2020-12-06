import 'file:///C:/Users/david/AndroidStudioProjects/FlutterProjects/bmi_calculator/lib/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Your Results',
                textAlign: TextAlign.center,
                style: kTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ReusableCard(
              cardColour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                    bmiResult,
                    style: kResultNumber,
                  ),
                  Column(
                    children: [
                      Text(
                        'Normal BMI range:',
                        style: kNormalRangeText,
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style: kResultNote,
                      ),
                    ],
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultNote,
                  ),
                  Container(
                    width: 150.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: kInactiveCardColour,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                        child: Text(
                      'SAVE RESULT',
                      style: kSaveResultStyle,
                    )),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            navigate: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
