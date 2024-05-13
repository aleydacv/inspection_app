import 'package:flutter/material.dart';

class CustomToggleButtons extends StatefulWidget {
  const CustomToggleButtons({
    super.key,
    required this.selectedList,
    required this.options,
    required this.onPressed,
    required this.title,
    required this.isTitle,
  });

  final List<bool> selectedList;
  final List<Widget> options;
  final Function(int) onPressed;
  final String title;
  final bool isTitle;

  @override
  State<CustomToggleButtons> createState() => _CustomToggleButtonsState();
}

class _CustomToggleButtonsState extends State<CustomToggleButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: widget.isTitle ? 18 : 15,
          ),
        ),
        ToggleButtons(
          isSelected: widget.selectedList,
          onPressed: widget.onPressed,
          constraints: const BoxConstraints(minHeight: 40, minWidth: 60),
          borderRadius: BorderRadius.circular(10),
          selectedColor: Colors.black,
          borderColor: Colors.black,
          selectedBorderColor: Colors.deepPurple,
          color: Colors.grey,
          children: widget.options,
        ),
      ],
    );
  }
}
