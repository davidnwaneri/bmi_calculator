import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColour;
  final Widget cardChild;
  final Function gestureDetector;

  ReusableCard(
      {@required this.cardColour, this.cardChild, this.gestureDetector});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gestureDetector,
      child: Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: cardColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
