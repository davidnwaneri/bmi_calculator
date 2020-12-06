import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String buttonText;
  final Function navigate;

  BottomButton({this.buttonText, this.navigate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: navigate,
        child: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomContainerHeight,
          color: kBottomContainerColour,
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                letterSpacing: 1.0,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
