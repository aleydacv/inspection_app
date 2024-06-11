import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/form/form_screen.dart';

class InspectionList extends StatelessWidget {
  const InspectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Inspecciones Asignadas"),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              })),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            return const CostumListItem();
          },
        ),
      ),
    );
  }
}

class CostumListItem extends StatelessWidget {
  const CostumListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () async {
            /*List<FormModel> forms = await DataBase.getForms();
            print("Forms aqui: ${forms[0].toMap()}");
            List<FormDetailModel> detail = await DataBase.getDetailById(1);
            print("Forms aqui: ${detail[0].toMap()}");*/
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FormScreen()),
            );
          },
          tileColor: Colors.white,
          title: const Text("Nombre del establecimiento"),
          subtitle: Text(
            "Nombre propietario y rubro",
            style: TextStyle(color: Colors.grey.shade700),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
        const Divider(
          height: 5,
        )
      ],
    );
  }
}
