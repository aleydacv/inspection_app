import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspection_app/screens/new_inspection/street_trading_form/components/point_of_sale.dart';
import 'package:inspection_app/screens/new_inspection/street_trading_form/components/sanitary_control.dart';
import 'package:inspection_app/widget/custom_button.dart';
import 'package:inspection_app/widget/custom_show_dialog.dart';
import 'package:inspection_app/widget/form_widget/auto_text_field.dart';
import 'package:inspection_app/widget/form_widget/custom_divider.dart';
import 'package:inspection_app/widget/form_widget/custom_switch_button.dart';
import 'package:inspection_app/widget/form_widget/input_text_field.dart';

enum SalesOption {
  comida,
  refrescos,
  helados,
  dulces,
  frutas,
  licuados,
  masitas,
  batidos,
  otro,
  comidaRapida
}

class StreetTradingForm extends StatefulWidget {
  const StreetTradingForm({super.key});

  @override
  State<StreetTradingForm> createState() => _StreetTradingFormState();
}

class _StreetTradingFormState extends State<StreetTradingForm> {
  final _formKey = GlobalKey<FormState>();
  final salesmanName = TextEditingController();
  final address = TextEditingController();
  DateTime currentDate = DateTime.now();
  final TextEditingController maleWorkers = TextEditingController();
  final TextEditingController femaleWorkers = TextEditingController();

  final List<Widget> multipleOptions = [
    const Text("Si"),
    const Text("No"),
    const Text("N/A")
  ];

  final List<bool> sanitaryCI = [false, false, false];
  final List<bool> workWear = [false, false, false];
  final List<bool> kitchenware = [false, false, false];
  final List<bool> foodPreservation = [false, false, false];
  final List<bool> sanitaryGarbage = [false, false, false];

  bool observations = true;
  final TextEditingController observationsController = TextEditingController();

  late List<List<bool>> allLists;
  SalesOption? _selectedOption = SalesOption.comida;

  @override
  void initState() {
    super.initState();
    allLists = [
      sanitaryCI,
      workWear,
      kitchenware,
      foodPreservation,
      sanitaryGarbage
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: const Text(
            "Formulario",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputTextField(
                      label: "Nombre Completo", controller: salesmanName),
                  InputTextField(label: "Dirección", controller: address),
                  AutoTextField(
                    label: "Fecha",
                    value:
                        "${currentDate.day}/${currentDate.month}/${currentDate.year}",
                  ),
                  const CustomDivider(),
                  PointOfSale(
                      selectedOption: _selectedOption,
                      onChanged: handleSalesOption),
                  const CustomDivider(),
                  SanitaryControl(
                      multipleOptions: multipleOptions,
                      sanitaryCI: sanitaryCI,
                      workWear: workWear,
                      kitchenware: kitchenware,
                      foodPreservation: foodPreservation,
                      sanitaryGarbage: sanitaryGarbage,
                      male: maleWorkers,
                      female: femaleWorkers,
                      onPressedToggle: onPressedToggle),
                  const CustomDivider(),
                  CustomSwitchButton(
                      label: "Observaciones",
                      value: observations,
                      onChange: (bool value) => {
                            setState(() {
                              observations = value;
                            })
                          }),
                  if (observations)
                    InputTextField(
                      label: "Detallar las Observaciones",
                      controller: observationsController,
                      addLines: true,
                      isTitle: false,
                    ),
                  CustomButton(
                      title: 'Guardar',
                      onPressed: _submitForm,
                      colorButton: Theme.of(context).primaryColor,
                      colorText: Colors.white),
                  const SizedBox(height: 5),
                  CustomButton(
                      title: 'Cancel',
                      onPressed: _cancelForm,
                      colorButton: Theme.of(context).colorScheme.secondaryFixed,
                      colorText: Colors.black)
                ],
              )),
        ),
      ),
    );
  }

  void handleSalesOption(SalesOption? value) {
    setState(() {
      _selectedOption = value;
    });
  }

  void onChangeRatingBar(double rating, double controller) {
    setState(() {
      controller = rating - 1;
    });
  }

  void onPressedToggle(int index, List<bool> list) {
    setState(() {
      for (int i = 0; i < list.length; i++) {
        list[i] = i == index;
      }
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_validateAllLists(allLists)) {
        CustomShowDialog.show(
            context: context,
            title: 'Error!',
            content:
                'Debes seleccionar al menos una opción en todas las listas.',
            dismissible: true,
            icon: Icons.warning_rounded,
            iconColor: Colors.red.shade800);
      } else {
        //_submitToDataBase();
      }
    }
  }

  /*Future<void> _submitToDataBase() async {
    try {
      FormModel form = _submitFormModel();
      int formId = await DataBase.insertForm(form);
      print("ID: $formId");
      FormDetailModel detail = _submitFormDetail(formId);
      await DataBase.insertFormDetail(detail);

      List<FormModel> forms = await DataBase.getForms();
      print("Forms: $forms");

      List<FormDetailModel> formDetails = await DataBase.getDetailById(formId);
      print("Form Details: ${formDetails}");
    } catch (e) {
      throw Exception('Error al intentar guardar el formulario');
    }
    List<FormDetailModel> formDetails = await DataBase.getDetailById(1);
    print("Form Details: ${formDetails}");
    goToBack();
  }*/

  void goToBack() {
    CustomShowDialog.show(
        context: context,
        title: 'Guardado!',
        content: 'El formulario se guardo con éxito.',
        icon: Icons.task_alt_rounded,
        iconColor: Colors.green,
        dismissible: false,
        onPressed: () {
          Navigator.of(context)
            ..pop()
            ..pop();
        });
  }

  void _cancelForm() {
    Navigator.of(context).pop();
  }

  /*FormModel _submitFormModel() {
    FormModel form = FormModel(
        userId: 1,
        sanitaryNumber: sanitaryController.text,
        notificationNumber: notificationController.text,
        maleSanitaryCi: sanitaryCI ? int.parse(countMaleCi.text) : 0,
        femaleSanitaryCi: sanitaryCI ? int.parse(countFemaleCi.text) : 0,
        date: "${currentDate.day}/${currentDate.month}/${currentDate.year}",
        latitude: _latitude ?? 0.0,
        longitude: _longitude ?? 0.0);
    return form;
  }*/

  int findIndex(List<bool> list) {
    return list.indexWhere((element) => element == true);
  }

  bool _validateAllLists(List<List<bool>> lists) {
    for (var list in lists) {
      if (!list.contains(true)) {
        return false;
      }
    }
    return true;
  }
}
