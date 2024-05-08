import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/auto_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/input_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/rating_slider.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sanitaryController = TextEditingController();
    final notificationController = TextEditingController();
    double currentSlide = 0;
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
              RatingSlider(currentSlideValue: currentSlide),
            ],
          )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("esto$currentSlide");
          },
          child: const Text("Aceptar ")),
    );
  }
}
