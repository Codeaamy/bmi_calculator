import 'package:bmi_calculator/home_page.dart';
import 'package:flutter/material.dart';

void main()=>runApp(BMICalculation());

class BMICalculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
