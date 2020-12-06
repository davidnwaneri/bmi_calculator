import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final IconData genderIcon;
  final String genderText;
  final Color textColor;
  final Color iconColor;

  IconCard({this.genderIcon, this.genderText, this.textColor, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
          color: iconColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: TextStyle(
            fontSize: 18.0,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
