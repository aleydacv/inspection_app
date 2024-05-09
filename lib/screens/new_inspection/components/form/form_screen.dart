import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/auto_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/input_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/raiting_bar.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final sanitaryController = TextEditingController();
  final notificationController = TextEditingController();
  double waterSupplyController = 0;
  /*final double restroomController;
    final double wasteDisposalController;
    final double insfrastructureController;
    final double householdController;*/
  int foodPreservationController = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulario"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              child: Column(
            children: <Widget>[
              const AutoTextField(
                label: "Establecimiento",
                value: "Capresso",
              ),
              const AutoTextField(
                label: "Nombre del propietario",
                value: "Capresso",
              ),
              const AutoTextField(
                label: "Razon Social",
                value: "Capresso",
              ),
              const AutoTextField(
                label: "Rubro",
                value: "Venta de cafe",
              ),
              const AutoTextField(
                label: "Zona",
                value: "Venta de cafe",
              ),
              const AutoTextField(
                label: "Direccion",
                value: "Venta de cafe",
              ),
              const AutoTextField(
                label: "Fecha",
                value: "Venta de cafe",
              ),
              InputTextField(
                  label: "N° Autorizacion Sanitaria",
                  controller: sanitaryController),
              InputTextField(
                  label: "N° Notificacion Comprobante",
                  controller: notificationController),
              RatingBarList(item: waterSupplyController),
              CustomRatingBar(
                  title: "Abastecimiento de agua",
                  controller: foodPreservationController.toDouble(),
                  onChanged: (double rating) {
                    setState(() {
                      foodPreservationController = rating.toInt() - 1;
                    });
                  }),
              /*  CustomRatingBar(
                title: "Estado sanitario de los baños",
                controller: restroomController
              ),
              CustomRatingBar(
                title: "Disposicion de residuos solidos",
                controller: wasteDisposalController,
              ),
              CustomRatingBar(
                title: "Infraestructura general",
                controller: insfrastructureController,
              ),
              CustomRatingBar(
                title: "Enseres, utencilios, menaje",
                controller: householdController,
              ),
              CustomRatingBar(
                title: "Conservacion adecuada de alimentos",
                controller: foodPreservationController,
              ),*/
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _submitForm();
          },
          child: const Text("Aceptar ")),
    );
  }

  void _submitForm() {
    print("VALOR: $waterSupplyController");
  }
}

class RatingBarList extends StatefulWidget {
  double item;
  RatingBarList({
    super.key,
    required this.item,
  });

  @override
  State<RatingBarList> createState() => _RatingBarListState();
}

class _RatingBarListState extends State<RatingBarList> {
  @override
  Widget build(BuildContext context) {
    return CustomRatingBar(
        title: "Abastecimeinto de agua",
        controller: widget.item,
        onChanged: (double rating) {
          setState(() {
            widget.item = rating;
            print("aqui $rating");
          });
        });
  }
}
