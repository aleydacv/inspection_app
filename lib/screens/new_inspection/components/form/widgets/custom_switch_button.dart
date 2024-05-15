import 'package:flutter/material.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton(
      {super.key,
      required this.label,
      required this.value,
      required this.onChange});
  final String label;
  final bool value;
  final Function(bool) onChange;

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        Switch(value: widget.value, onChanged: widget.onChange),
      ],
    );
  }
}
