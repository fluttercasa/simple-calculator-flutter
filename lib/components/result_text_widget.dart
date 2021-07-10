import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/core/ui_helper.dart';

class ResultTextWidget extends StatelessWidget {
  const ResultTextWidget({
    Key? key,
    required this.result,
  }) : super(key: key);

  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
      child: Text(result, style: resultStyle),
    );
  }
}
