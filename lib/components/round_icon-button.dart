import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function weightChange;

  RoundIconButton({@required this.icon, @required this.weightChange});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: weightChange,
      fillColor: Color(0xFF4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
      shape: CircleBorder(),
      child: Icon(
        icon,
      ),
    );
  }
}
