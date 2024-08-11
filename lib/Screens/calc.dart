import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import '../utils/button.dart';
import 'package:calculator/state/controller/logic.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorController calculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TypeWriter.text("Calculator",
            maintainSize: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 120)),
        leading: IconButton(
          icon: const Icon(
            Icons.history,
            size: 33,
          ),
          onPressed: () {
            Get.toNamed('/history');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: calculatorController.equationController,
                      style: const TextStyle(fontSize: 48, color: Colors.white),
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: calculatorController.resultController,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.right,
                      readOnly: true,
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Row(
                  children: [
                    Button(
                      text: "AC",
                      tColor: Colors.green,
                      buttonBgColor: Colors.white10,
                      tSize: 15.0,
                      onButtonClick: calculatorController.clear,
                    ),
                    Button(
                      text: 'C',
                      tColor: Colors.red,
                      onButtonClick: calculatorController.delete,
                    ),
                    Button(
                      text: '%',
                      buttonBgColor: Colors.transparent,
                      onButtonClick: () => calculatorController.addInput('%'),
                    ),
                    Button(
                      text: '/',
                      tColor: Colors.lightGreen,
                      onButtonClick: () => calculatorController.addInput('/'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      text: '7',
                      onButtonClick: () => calculatorController.addInput('7'),
                    ),
                    Button(
                      text: '8',
                      onButtonClick: () => calculatorController.addInput('8'),
                    ),
                    Button(
                      text: '9',
                      onButtonClick: () => calculatorController.addInput('9'),
                    ),
                    Button(
                      text: 'x',
                      tColor: Colors.lightGreen,
                      onButtonClick: () => calculatorController.addInput('x'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      text: '4',
                      onButtonClick: () => calculatorController.addInput('4'),
                    ),
                    Button(
                      text: '5',
                      onButtonClick: () => calculatorController.addInput('5'),
                    ),
                    Button(
                      text: '6',
                      onButtonClick: () => calculatorController.addInput('6'),
                    ),
                    Button(
                      text: '-',
                      tColor: Colors.lightGreen,
                      onButtonClick: () => calculatorController.addInput('-'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Button(
                      text: "1",
                      onButtonClick: () => calculatorController.addInput('1'),
                    ),
                    Button(
                      text: "2",
                      onButtonClick: () => calculatorController.addInput('2'),
                    ),
                    Button(
                      text: '3',
                      onButtonClick: () => calculatorController.addInput('3'),
                    ),
                    Button(
                      text: '+',
                      tColor: Colors.lightGreen,
                      onButtonClick: () => calculatorController.addInput('+'),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 21.0),
                  child: Row(
                    children: [
                      Button(
                        text: '%',
                        tColor: Colors.green,
                        onButtonClick: () => calculatorController.addInput('%'),
                      ),
                      Button(
                        text: '0',
                        onButtonClick: () => calculatorController.addInput('0'),
                      ),
                      Button(
                        text: '.',
                        onButtonClick: () => calculatorController.addInput('.'),
                      ),
                      Button(
                        text: '=',
                        buttonBgColor: Colors.green,
                        onButtonClick: calculatorController.calculate,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
