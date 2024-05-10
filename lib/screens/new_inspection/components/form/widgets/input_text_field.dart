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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          onTapOutside: (event) => {FocusNode().unfocus()},
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.all(12)),
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
