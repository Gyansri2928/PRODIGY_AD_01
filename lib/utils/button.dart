import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Color? buttonBgColor;
  final VoidCallback? onButtonClick; // Changed to VoidCallback
  final String? text;
  final double? tSize;
  final Color? tColor;

  const Button({
    Key? key,
    this.buttonBgColor,
    this.onButtonClick,
    this.text,
    this.tSize = 22,
    this.tColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(7),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(27),
            backgroundColor: buttonBgColor,
          ),
          onPressed: () {
            if (onButtonClick != null) {
              onButtonClick!(); // Call the function without arguments
            }
          },
          child: Text(
            text ?? '', // Provide a default empty string if text is null
            style: TextStyle(
              fontSize: tSize,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
