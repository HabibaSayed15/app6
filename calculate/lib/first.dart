//import 'dart:io';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalculatorApp> {
  String result = '';

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        result = _calculateResult();
      } else if (buttonText == 'C') {
        result = '';
      } else {
        result += buttonText;
      }
    });
  }

  String formatResult(double evalResult) {
    if (evalResult % 1 == 0) {
      return evalResult.toInt().toString();
    } else {
      return evalResult.toString();
    }
  }

  String _calculateResult() {
    String expression = result;

    try {
      Parser p = Parser();
      ContextModel x = ContextModel();
      var exp = p.parse(expression);
      double evalResult = exp.evaluate(EvaluationType.REAL, x);

      return formatResult(evalResult);
    } catch (e) {
      return 'Error';
    }
  }

  //int num1=int.parse(stdin.readLineSync()!);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Center(child: Text("simple calculator")),
              backgroundColor: Colors.blueGrey,
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      result,
                      style: const TextStyle(
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildButton('7'),
                    _buildButton('8'),
                    _buildButton('9'),
                    _buildButton('/'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildButton('4'),
                    _buildButton('5'),
                    _buildButton('6'),
                    _buildButton('*'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildButton('1'),
                    _buildButton('2'),
                    _buildButton('3'),
                    _buildButton('-'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildButton('0'),
                    _buildButton('C'),
                    _buildButton('='),
                    _buildButton('+'),
                  ],
                ),
              ],
            )));
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.blueAccent)),
              fixedSize: const Size(70, 70)),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
