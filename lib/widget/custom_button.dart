import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color colorButton;
  final Color colorText;
  final VoidCallback onPressed;
  const CustomButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.colorButton,
      required this.colorText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size.fromHeight(45)),
          backgroundColor: WidgetStatePropertyAll(colorButton)),
      child: Text(
        title,
        style: TextStyle(color: colorText, fontSize: 18),
      ),
    );
  }
}
