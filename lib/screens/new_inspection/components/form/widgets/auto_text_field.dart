import 'package:flutter/material.dart';

class AutoTextField extends StatelessWidget {
  final String label;
  final String value;
  const AutoTextField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      autofocus: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
