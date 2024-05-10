import 'package:flutter/material.dart';

class AutoTextField extends StatelessWidget {
  final String label;
  final String value;
  const AutoTextField({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 5),
        TextFormField(
          initialValue: value,
          style: const TextStyle(fontSize: 16),
          readOnly: true,
          autofocus: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.all(12)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
