import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/street_trading_form/street_trading_form_screen.dart';

class PointOfSale extends StatelessWidget {
  const PointOfSale(
      {super.key, required this.selectedOption, required this.onChanged});
  final SalesOption? selectedOption;
  final ValueChanged<SalesOption?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            "Punto de Venta:",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Comidas',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.comida,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Refresco',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.refrescos,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Helados',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.helados,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Dulces',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.dulces,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Frutas',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.frutas,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Licuados',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.licuados,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Masitas',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.masitas,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Batidos',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.batidos,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Venta de Comida Rapida',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.comidaRapida,
            groupValue: selectedOption,
            onChanged: onChanged),
        RadioListTile<SalesOption>(
            title: const Text(
              'Otro',
              style: TextStyle(fontSize: 15),
            ),
            value: SalesOption.otro,
            groupValue: selectedOption,
            onChanged: onChanged),
      ],
    );
  }
}
