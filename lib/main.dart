import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/calculator_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: CalculatorHome(),
    );
  }
}
