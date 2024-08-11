import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart'; // Assuming you use this for evaluating expressions

class CalculatorController extends GetxController {
  final equationController = TextEditingController();
  final resultController = TextEditingController();
  final history = <String>[].obs; // Observable list for history

  void addInput(String input) {
    // Append input to equation
    equationController.text += input;
  }

  void clear() {
    equationController.clear();
    resultController.clear();
  }

  void delete() {
    if (equationController.text.isNotEmpty) {
      equationController.text = equationController.text.substring(0, equationController.text.length - 1);
    }
  }

  void calculate() {
    try {
      final result = _evaluate(equationController.text);
      final equation = equationController.text;
      resultController.text = result.toString();
      if (equation.isNotEmpty) {
        history.add('$equation = $result'); // Add complete calculation to history
      }
    } catch (e) {
      resultController.text = 'Error';
    }
  }

  double _evaluate(String expression) {
    // Evaluate the expression and return the result
    final expr = Expression.parse(expression.replaceAll('x', '*'));
    final evaluator = const ExpressionEvaluator();
    final result = evaluator.eval(expr, {});
    return result.toDouble();
  }

  void clearHistory() {
    history.clear();
  }
}
