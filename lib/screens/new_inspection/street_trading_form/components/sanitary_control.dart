import 'package:flutter/material.dart';
import 'package:inspection_app/widget/form_widget/input_text_fiel_male_female.dart';
import 'package:inspection_app/widget/form_widget/toggle_buttons.dart';

class SanitaryControl extends StatelessWidget {
  const SanitaryControl(
      {super.key,
      required this.multipleOptions,
      required this.sanitaryCI,
      required this.workWear,
      required this.kitchenware,
      required this.foodPreservation,
      required this.sanitaryGarbage,
      required this.male,
      required this.female,
      required this.onPressedToggle});
  final List<Widget> multipleOptions;
  final List<bool> sanitaryCI;
  final List<bool> workWear;
  final List<bool> kitchenware;
  final List<bool> foodPreservation;
  final List<bool> sanitaryGarbage;
  final TextEditingController male;
  final TextEditingController female;
  final Function onPressedToggle;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Control Sanitario:",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      CustomToggleButtons(
          selectedList: sanitaryCI,
          options: multipleOptions,
          onPressed: (int index) => onPressedToggle(index, sanitaryCI),
          title: "Carnet Sanitario",
          isTitle: false),
      CustomToggleButtons(
          selectedList: kitchenware,
          options: multipleOptions,
          onPressed: (int index) => onPressedToggle(index, kitchenware),
          title: "Menaje de Cocina",
          isTitle: false),
      CustomToggleButtons(
          selectedList: foodPreservation,
          options: multipleOptions,
          onPressed: (int index) => onPressedToggle(index, foodPreservation),
          title: "Cons. de Alimentos",
          isTitle: false),
      CustomToggleButtons(
          selectedList: sanitaryGarbage,
          options: multipleOptions,
          onPressed: (int index) => onPressedToggle(index, sanitaryGarbage),
          title: "Basurero Sanitario",
          isTitle: false),
      const Text(
        'Numero de personas que trabajan',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      InputFieldMaleFemale(countMaleCi: male, countFemaleCi: female),
    ]);
  }
}
