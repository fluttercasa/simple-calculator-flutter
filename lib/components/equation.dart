import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/core/ui_helper.dart';

class EquationWidget extends StatelessWidget {
  const EquationWidget({
    Key? key,
    required this.equation,
  }) : super(key: key);

  final String equation;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Text(equation, style: equationtStyle),
    );
  }
}
