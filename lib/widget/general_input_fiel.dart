import 'package:flutter/material.dart';

class GeneralInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  const GeneralInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon});

  @override
  State<GeneralInputField> createState() => _GeneralInputFieldState();
}

class _GeneralInputFieldState extends State<GeneralInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            size: 18,
          ),
          prefixIconColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.white, fontSize: 16),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gapPadding: 3),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.all(2)),
    );
  }
}
