import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const InputTextField(
      {super.key, required this.label, required this.controller});

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (event) => {FocusNode().unfocus()},
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(
          widget.label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
