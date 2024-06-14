import 'package:flutter/material.dart';

class ScheduleInputField extends StatefulWidget {
  const ScheduleInputField({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override
  State<ScheduleInputField> createState() => _ScheduleInputFieldState();
}

class _ScheduleInputFieldState extends State<ScheduleInputField> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 1),
      //locale: const Locale('es', 'ES'),
    );
    if (picked != null && picked != currentDate) {
      setState(() {
        widget.dateController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: const Key("Schedule"),
          controller: widget.dateController,
          readOnly: true,
          style: const TextStyle(fontSize: 16),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(12),
            suffixIcon: Icon(Icons.calendar_month),
            hintText: "Seleccione una fecha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          ),
          onTap: () {
            _selectDate(context);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese una fecha';
            }
            return null;
          },
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
