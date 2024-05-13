import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/input_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/toggle_buttons.dart';

class PestControl extends StatelessWidget {
  const PestControl(
      {super.key,
      required this.pestName,
      required this.yesNoOptions,
      required this.pestAuthorization,
      required this.pestReport,
      required this.onPressedToggle});
  final TextEditingController pestName;
  final List<Widget> yesNoOptions;
  final List<bool> pestAuthorization;
  final List<bool> pestReport;
  final Function onPressedToggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Control de plagas:",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 15,
        ),
        InputTextField(
          label: "Nombre",
          controller: pestName,
          isTitle: false,
        ),
        CustomToggleButtons(
            selectedList: pestAuthorization,
            options: yesNoOptions,
            title: "Certificado Actualizado",
            isTitle: false,
            onPressed: (int index) =>
                onPressedToggle(index, pestAuthorization)),
        CustomToggleButtons(
            selectedList: pestReport,
            options: yesNoOptions,
            title: "Informe Tecnico",
            isTitle: false,
            onPressed: (int index) => onPressedToggle(index, pestReport)),
      ],
    );
  }
}
