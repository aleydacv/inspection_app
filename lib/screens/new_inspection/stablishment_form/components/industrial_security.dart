import 'package:flutter/material.dart';
import 'package:inspection_app/widget/form_widget/toggle_buttons.dart';

class IndustrialSecurity extends StatelessWidget {
  const IndustrialSecurity(
      {super.key,
      required this.multipleOptions,
      required this.workWear,
      required this.fireExtinguisher,
      required this.firstAidKit,
      required this.onPressedToggle});
  final List<Widget> multipleOptions;
  final List<bool> workWear;
  final List<bool> fireExtinguisher;
  final List<bool> firstAidKit;
  final Function onPressedToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Seguridad Industrial:",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomToggleButtons(
            selectedList: workWear,
            options: multipleOptions,
            title: "Ropa de Trabajo",
            isTitle: false,
            onPressed: (int index) => onPressedToggle(index, workWear)),
        CustomToggleButtons(
            selectedList: fireExtinguisher,
            options: multipleOptions,
            title: "Extintor",
            isTitle: false,
            onPressed: (int index) => onPressedToggle(index, fireExtinguisher)),
        CustomToggleButtons(
            selectedList: firstAidKit,
            options: multipleOptions,
            title: "Botiquin",
            isTitle: false,
            onPressed: (int index) => onPressedToggle(index, firstAidKit)),
      ],
    );
  }
}
