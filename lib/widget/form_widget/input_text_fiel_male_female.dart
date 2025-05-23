import 'package:flutter/material.dart';

class InputFieldMaleFemale extends StatelessWidget {
  const InputFieldMaleFemale({
    super.key,
    required this.countMaleCi,
    required this.countFemaleCi,
  });

  final TextEditingController countMaleCi;
  final TextEditingController countFemaleCi;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
            key: const Key("Male"),
            controller: countMaleCi,
            keyboardType: TextInputType.number,
            maxLength: 2,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: "Masculinos",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese la cantidad correspondiente';
              }
              return null;
            },
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 5,
          child: TextFormField(
            key: const Key("Female"),
            controller: countFemaleCi,
            keyboardType: TextInputType.number,
            maxLength: 2,
            style: const TextStyle(fontSize: 16),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: "Femeninos",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingrese la cantidad correspondiente';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
