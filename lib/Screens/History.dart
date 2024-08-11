import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:calculator/state/controller/logic.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    final CalculatorController calculatorController = Get.find(); // Get the instance of CalculatorController

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TypeWriter.text("History",
            maintainSize: true,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 120)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              calculatorController.clearHistory();
            },
          )
        ],
      ),
      body: Obx(() {
        if (calculatorController.history.isEmpty) {
          return const Center(child: Text('No history available'));
        }
        return ListView.builder(
          itemCount: calculatorController.history.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30), // Oval border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(15), // Padding inside ListTile
                title: Text(
                  calculatorController.history[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
