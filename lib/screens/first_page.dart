import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_card.dart';
import '../constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon-button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

// this will help specify what gender was selected.
enum Gender { male, female }

class _FirstPageState extends State<FirstPage> {
  Gender selectedCard;
  double bodyHeight = 120.0;
  int bodyWeight = 60;
  int age = 16;

  Color selectGender(Gender selectedGender) {
    return selectedCard == selectedGender
        ? kActiveSymbolColour
        : kInactiveSymbolColour;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    gestureDetector: () {
                      setState(() {
                        selectedCard = Gender.male;
                      });
                    },
                    cardColour: selectedCard == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconCard(
                      genderIcon: FontAwesomeIcons.mars,
                      iconColor: selectGender(Gender.male),
                      genderText: 'MALE',
                      textColor: selectedCard == Gender.male
                          ? kActiveSymbolColour
                          : kInactiveSymbolColour,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    gestureDetector: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                    cardColour: selectedCard == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconCard(
                      genderIcon: FontAwesomeIcons.venus,
                      iconColor: selectGender(Gender.female),
                      genderText: "FEMALE",
                      textColor: selectedCard == Gender.female
                          ? kActiveSymbolColour
                          : kInactiveSymbolColour,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardColour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kCardTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      bodyHeight.toStringAsFixed(1),
                      style: kNumberStyle,
                    ),
                    Text(
                      'cm',
                      style: kCardTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    inactiveTrackColor: Color(0xFF71737e),
                    activeTrackColor: Color(0xFFeb1555),
                    thumbColor: Color(0xFFeb1555),
                    overlayColor: Color(0x29eb1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: bodyHeight,
                    min: 100.0,
                    max: 270.0,
                    onChanged: (double newValue) {
                      setState(() {
                        bodyHeight = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  cardColour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kCardTextStyle,
                      ),
                      Text(
                        '$bodyWeight',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            weightChange: () {
                              setState(() {
                                bodyWeight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            weightChange: () {
                              setState(() {
                                bodyWeight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  cardColour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: kCardTextStyle,
                      ),
                      Text(
                        '$age',
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            weightChange: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            weightChange: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE YOUR BMI',
            navigate: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: bodyHeight, weight: bodyWeight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}
