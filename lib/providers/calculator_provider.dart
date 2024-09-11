import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  final List<String> _buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  List<String> get buttons => _buttons;

  var userQuestion = '';
  var userAnswer = '';

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
    notifyListeners();
  }

  void eraseAll() {
    userQuestion = '';
    userAnswer = '';
    notifyListeners();
  }

  void deleteButton() {
    if (userQuestion.isNotEmpty) {
      userQuestion = userQuestion.substring(0, userQuestion.length - 1);
    }
    notifyListeners();
  }

  void showAnswer() {
    equalPressed();
    notifyListeners();
  }

  void buttonPushed(int index) {
    userQuestion += buttons[index];
    notifyListeners();
  }
}
