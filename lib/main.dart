import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/first_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0a0d22),
        scaffoldBackgroundColor: Color(0xFF0a0d22),
      ),
      home: FirstPage(),
    );
  }
}
