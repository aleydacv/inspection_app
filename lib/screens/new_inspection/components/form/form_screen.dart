import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/components/biosafety_control.dart';
import 'package:inspection_app/screens/new_inspection/components/form/components/industrial_security.dart';
import 'package:inspection_app/screens/new_inspection/components/form/components/pest_control.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/auto_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/custom_divider.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/input_text_field.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/raiting_bar.dart';
import 'package:inspection_app/screens/new_inspection/components/form/widgets/toggle_buttons.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final sanitaryController = TextEditingController();
  final notificationController = TextEditingController();
  double waterSupplyController = 0;
  double restroomController = 0;
  double wasteDisposalController = 0;
  double insfrastructureController = 0;
  double householdController = 0;
  double foodPreservationController = 0;
  bool sanitaryCI = false;

  final List<Widget> multipleOptions = [
    const Text("Si"),
    const Text("No"),
    const Text("N/A")
  ];
  final List<Widget> yesNoOptions = [
    const Text("Si"),
    const Text("No"),
  ];
  final List<Widget> maleFemaleOptions = [
    const Icon(Icons.male_rounded),
    const Icon(Icons.female_rounded)
  ];

  final List<bool> workWear = [false, false, false];
  final List<bool> fireExtinguisher = [false, false, false];
  final List<bool> firstAidKit = [false, false, false];
  final List<bool> sanitaryCi = [false, false];

  final TextEditingController pestName = TextEditingController();
  final List<bool> pestAuthorization = [false, false];
  final List<bool> pestReport = [false, false];

  final List<bool> biosafetyProtocol = [false, false];
  final List<bool> biosafetySigns = [false, false];
  final List<bool> faceMask = [false, false];
  final List<bool> disposableGloves = [false, false];
  final List<bool> hairControl = [false, false];
  final List<bool> alcohol = [false, false];
  final List<bool> cleaningLog = [false, false, false];
  final List<bool> indoorDisinfection = [false, false];
  final List<bool> outdoorDisinfection = [false, false];

  final TextEditingController desinfectionProduct = TextEditingController();
  bool controlOilExists = false;
  final TextEditingController usedOilController = TextEditingController();
  final TextEditingController observationsController = TextEditingController();

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
              CustomToggleButtons(
                  selectedList: sanitaryCi,
                  options: maleFemaleOptions,
                  title: "Carnet Sanitario",
                  isTitle: true,
                  onPressed: (int index) => onPressedToggle(index, sanitaryCi)),
              const CustomDivider(),
              CustomRatingBar(
                  title: "Abastecimiento de agua",
                  controller: waterSupplyController,
                  onChanged: (double rating) =>
                      onChangeRatingBar(rating, waterSupplyController)),
              CustomRatingBar(
                  title: "Estado sanitario de los baños",
                  controller: restroomController,
                  onChanged: (double rating) {
                    setState(() {
                      restroomController = rating - 1;
                    });
                  }),
              CustomRatingBar(
                  title: "Disposicion de residuos solidos",
                  controller: wasteDisposalController,
                  onChanged: (double rating) {
                    setState(() {
                      wasteDisposalController = rating - 1;
                    });
                  }),
              CustomRatingBar(
                  title: "Infraestructura general",
                  controller: insfrastructureController,
                  onChanged: (double rating) {
                    setState(() {
                      insfrastructureController = rating - 1;
                    });
                  }),
              CustomRatingBar(
                  title: "Enseres, utencilios, menaje",
                  controller: householdController,
                  onChanged: (double rating) {
                    setState(() {
                      householdController = rating - 1;
                    });
                  }),
              CustomRatingBar(
                  title: "Conservacion adecuada de alimentos",
                  controller: foodPreservationController,
                  onChanged: (double rating) {
                    setState(() {
                      foodPreservationController = rating - 1;
                    });
                  }),
              const CustomDivider(),
              IndustrialSecurity(
                  multipleOptions: multipleOptions,
                  workWear: workWear,
                  fireExtinguisher: fireExtinguisher,
                  firstAidKit: firstAidKit,
                  onPressedToggle: onPressedToggle),
              const CustomDivider(),
              PestControl(
                  pestName: pestName,
                  yesNoOptions: yesNoOptions,
                  pestAuthorization: pestAuthorization,
                  pestReport: pestReport,
                  onPressedToggle: onPressedToggle),
              const CustomDivider(),
              BiosafetyControl(
                yesNoOptions: yesNoOptions,
                multipleOptions: multipleOptions,
                biosafetyProtocol: biosafetyProtocol,
                biosafetySigns: biosafetySigns,
                faceMask: faceMask,
                disposableGloves: disposableGloves,
                hairControl: hairControl,
                alcohol: alcohol,
                cleaningLog: cleaningLog,
                indoorDisinfection: indoorDisinfection,
                outdoorDisinfection: outdoorDisinfection,
                onPressedToggle: onPressedToggle,
                desinfectionProduct: desinfectionProduct,
              ),
              const CustomDivider(),
              Switch(
                  value: controlOilExists,
                  onChanged: (bool value) {
                    controlOilExists = value;
                  }),
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

  void onChangeRatingBar(double rating, double controller) {
    setState(() {
      controller = rating - 1;
    });
    print("mmm: $controller");
  }

  void onPressedToggle(int index, List<bool> list) {
    setState(() {
      for (int i = 0; i < list.length; i++) {
        list[i] = i == index;
      }
    });
  }

  void _submitForm() {
    print("VALOR: $pestReport");
  }
}
