import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isTitle;
  final bool addLines;
  const InputTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.isTitle = true,
      this.addLines = false});

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
          style: TextStyle(fontSize: widget.isTitle ? 18 : 15),
        ),
        const SizedBox(height: 5),
        TextFormField(
          key: Key(widget.label),
          controller: widget.controller,
          //onTapOutside: (event) => {FocusNode().unfocus()},
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.all(12)),
          style: const TextStyle(fontSize: 16),
          maxLines: widget.addLines ? 3 : 1,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese los datos correspondientes';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
  
}
