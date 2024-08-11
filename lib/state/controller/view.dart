import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ControllerPage extends StatelessWidget {
  ControllerPage({Key? key}) : super(key: key);

  final logic = Get.put(CalculatorController());


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
