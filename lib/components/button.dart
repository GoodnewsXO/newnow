import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final Color buttonColor;

  // Constructor to accept parameters for customization
  const Button({
    super.key,
    required this.text,
    required this.textColor,
    required this.width,
    this.height = 53.0,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor, // Use the predefined color
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Dynamic text color
              fontFamily: 'Roboto', // Fixed font
            ),
          ),
        ),
      ),
    );
  }
}
