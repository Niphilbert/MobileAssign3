import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(
      String buttonText, Color buttonColor, double buttonHeight) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
        margin: EdgeInsets.all(8.0),
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            side: MaterialStateProperty.all(
              BorderSide(color: buttonColor, width: 2.0),
            ),
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: buttonColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7", Colors.white, 1),
                  buildButton("8", Colors.white, 1),
                  buildButton("9", Colors.white, 1),
                  buildButton("/", Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  buildButton("4", Colors.white, 1),
                  buildButton("5", Colors.white, 1),
                  buildButton("6", Colors.white, 1),
                  buildButton("*", Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  buildButton("1", Colors.white, 1),
                  buildButton("2", Colors.white, 1),
                  buildButton("3", Colors.white, 1),
                  buildButton("-", Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  buildButton(".", Colors.white, 1),
                  buildButton("0", Colors.white, 1),
                  buildButton("00", Colors.white, 1),
                  buildButton("+", Colors.orange, 1),
                ],
              ),
              Row(
                children: [
                  buildButton("CLEAR", Colors.red, 1),
                  buildButton("=", Colors.green, 1),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
