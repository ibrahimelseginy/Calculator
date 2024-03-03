// import 'dart:js';

import 'package:calculator/caclculator_button.dart';
import 'package:flutter/material.dart';

/*
  types of State ??
  
1- StatelessWidget => 
  1- one_class extends StatelessWidget
  2- rebuild once time

2- StatefulWidget => 
 1- two_class => 
    1- class extends StatefulWidget (override => createState)
    2- class  State extends StatefulWidget
 2- rebuild every time => setState() => in the StatefulWidget only
*/
// ignore: camel_case_types
class calculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator';

  const calculatorScreen({super.key});

  @override
  State<calculatorScreen> createState() => _calculatorScreenState();
}

// ignore: camel_case_types
class _calculatorScreenState extends State<calculatorScreen> {
  String resultText = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          alignment: Alignment.bottomRight,
          margin: const EdgeInsets.only(right: 4),
          child: Text(
            resultText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calculatorButton(
                text: '7',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '8',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '9',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '*',
                onClicked: onOperatorClicked, // call_back_function
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calculatorButton(
                text: '4',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '5',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '6',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '-',
                onClicked: onOperatorClicked, // call_back_function
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calculatorButton(
                text: '1',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '2',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '3',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '+',
                onClicked: onOperatorClicked, // call_back_function
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              calculatorButton(
                text: '/',
                onClicked: onOperatorClicked, // call_back_function
              ),
              calculatorButton(
                text: '0',
                onClicked: onDigitClicked, // call_back_function
              ),
              calculatorButton(
                text: '.',
                onClicked: onDotClicked, // call_back_function
              ),
              calculatorButton(
                text: '=',
                onClicked: onEqualclicked, // call_back_function
              ),
            ],
          ),
        )
      ]),
    );
  }

  String savedNumber = '';
  String savedOperator = '';

  void onDigitClicked(String digit) {
    setState(() {
      resultText += digit;
    });
    // resultText += digit;
    // setState(() {});
  }

  void onOperatorClicked(String operator) {
    if (resultText.isEmpty) {
      return;
    }
    if (savedNumber.isEmpty) {
      savedNumber = resultText;
      savedOperator = operator;
    } else {
      calculate(savedNumber, savedOperator, resultText);
      savedNumber = '';
      savedOperator = '';
    }
    resultText = '';
    setState(() {});
  }

  void calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    if (operator == '+') {
      resultText = (num1 + num2).toString();
    }
    if (operator == '-') {
      resultText = (num1 - num2).toString();
    }
    if (operator == '/') {
      resultText = (num1 / num2).toString();
    }
    if (operator == '*') {
      resultText = (num1 * num2).toString();
    }
    setState(() {});
  }

  void onEqualclicked(String text) {
    if (savedNumber.isEmpty) {
      return;
    }
    calculate(savedNumber, savedOperator, resultText);
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  void onDotClicked(String text) {
    if (resultText.contains('.')) {
      return;
    }
    resultText += '.';
    setState(() {});
  }
}
/*
  '2' .toInt();
extension numberParsing on String {
  int toInt() {
    int number = int.parse(this);
    return number;
  }
}
*/

/*

extension NavigatorExtension on BuildContext {
  toView(Widget view) {
    Navigator.push(this, MaterialPageRoute(builder: (context) {
      return view;
    }));
  }
}

*/