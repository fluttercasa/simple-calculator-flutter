import 'package:flutter/material.dart';
import 'package:flutter_calculator_app/components/button_widget.dart';
import 'package:flutter_calculator_app/components/equation.dart';
import 'package:flutter_calculator_app/components/result_text_widget.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String equation = "0";
  String result = "0";
  String expression = "0";

  buttonPressed(String buttonText) {
    print(buttonText);

    setState(() {
      // if Button text is C
      // make equation to 0
      // make result to 0
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "x") {
        // if button with text x is tapped
        // remove last digit from equation
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        print("equattion: $equation");
        expression = equation;
        print("1 expression: $expression");
        expression = expression.replaceAll('x', '*');
        print("2 expression: $expression");
        expression = expression.replaceAll('/', '/');
        print("3 expression: $expression");

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        }
        equation = equation + buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          EquationWidget(equation: equation),
          ResultTextWidget(result: result),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ButtonWidget(
                          title: "C",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("C"),
                        ),
                        ButtonWidget(
                          title: "x",
                          bgColor: Colors.greenAccent,
                          onTap: () => buttonPressed("x"),
                        ),
                        ButtonWidget(
                          title: "/",
                          bgColor: Colors.redAccent,
                          onTap: () => buttonPressed("/"),
                        ),
                        ButtonWidget(
                          title: "*",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("*"),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonWidget(
                          title: "7",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("7"),
                        ),
                        ButtonWidget(
                          title: "8",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("8"),
                        ),
                        ButtonWidget(
                          title: "9",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("9"),
                        ),
                        ButtonWidget(
                          title: "-",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("-"),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonWidget(
                          title: "4",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("4"),
                        ),
                        ButtonWidget(
                          title: "5",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("5"),
                        ),
                        ButtonWidget(
                          title: "6",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("6"),
                        ),
                        ButtonWidget(
                          title: "+",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("+"),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonWidget(
                          title: "1",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("1"),
                        ),
                        ButtonWidget(
                          title: "2",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("2"),
                        ),
                        ButtonWidget(
                          title: "3",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("3"),
                        ),
                        ButtonWidget(
                          title: "/",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("/"),
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        ButtonWidget(
                          title: ".",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("."),
                        ),
                        ButtonWidget(
                          title: "0",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("0"),
                        ),
                        ButtonWidget(
                          title: "00",
                          bgColor: Colors.black,
                          onTap: () => buttonPressed("00"),
                        ),
                        ButtonWidget(
                          title: "=",
                          bgColor: Colors.blueAccent,
                          onTap: () => buttonPressed("="),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
