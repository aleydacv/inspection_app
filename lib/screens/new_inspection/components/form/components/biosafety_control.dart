import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/input_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/toggle_buttons.dart';

class BiosafetyControl extends StatelessWidget {
  const BiosafetyControl(
      {super.key,
      required this.yesNoOptions,
      required this.multipleOptions,
      required this.biosafetyProtocol,
      required this.biosafetySigns,
      required this.faceMask,
      required this.disposableGloves,
      required this.hairControl,
      required this.alcohol,
      required this.cleaningLog,
      required this.indoorDisinfection,
      required this.outdoorDisinfection,
      required this.onPressedToggle,
      required this.desinfectionProduct});
  final List<Widget> yesNoOptions;
  final List<Widget> multipleOptions;
  final List<bool> biosafetyProtocol;
  final List<bool> biosafetySigns;
  final List<bool> faceMask;
  final List<bool> disposableGloves;
  final List<bool> hairControl;
  final List<bool> alcohol;
  final List<bool> cleaningLog;
  final List<bool> indoorDisinfection;
  final List<bool> outdoorDisinfection;
  final Function onPressedToggle;
  final TextEditingController desinfectionProduct;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Bioseguridad:",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(
        height: 15,
      ),
      CustomToggleButtons(
          selectedList: biosafetyProtocol,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, biosafetyProtocol),
          title: "Cuenta con Protocolo",
          isTitle: false),
      CustomToggleButtons(
          selectedList: biosafetySigns,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, biosafetySigns),
          title: "Cuenta con Señaletica",
          isTitle: false),
      const SizedBox(height: 10),
      const Text(
        "Cuenta con Barreras de Bioseguridad:",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 10),
      CustomToggleButtons(
          selectedList: faceMask,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, faceMask),
          title: "Barbijo",
          isTitle: false),
      CustomToggleButtons(
          selectedList: disposableGloves,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, disposableGloves),
          title: "Guantes",
          isTitle: false),
      CustomToggleButtons(
          selectedList: hairControl,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, hairControl),
          title: "C. Pelo",
          isTitle: false),
      CustomToggleButtons(
          selectedList: alcohol,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, alcohol),
          title: "Alcohol",
          isTitle: false),
      CustomToggleButtons(
          selectedList: cleaningLog,
          options: multipleOptions,
          onPressed: (int index) => onPressedToggle(index, cleaningLog),
          title: "Registro de Limpieza",
          isTitle: false),
      const SizedBox(height: 10),
      const Text(
        "Realiza la Dsinfeccion:",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 10),
      CustomToggleButtons(
          selectedList: indoorDisinfection,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, indoorDisinfection),
          title: "Interior",
          isTitle: false),
      CustomToggleButtons(
          selectedList: outdoorDisinfection,
          options: yesNoOptions,
          onPressed: (int index) => onPressedToggle(index, outdoorDisinfection),
          title: "Exterior",
          isTitle: false),
      InputTextField(
        label: "Producto para la desinfeccion",
        controller: desinfectionProduct,
        isTitle: false,
      )
    ]);
  }
}
