import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/assigned_inspections/inspection_list.dart';

class NewInspectionScreen extends StatelessWidget {
  const NewInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("el titulo aqui"),
          //backgroundColor: Colors.deepPurpleAccent[100],
        ),
        //backgroundColor: const Color.fromARGB(255, 246, 247, 249),
        backgroundColor: const Color(0xFFF6F5FA),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Realice una Inspeccion",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomIconButton(
                      icon: Icons.storefront,
                      text: "Establecimientos",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    CustomIconButton(
                      icon: Icons.beach_access_outlined,
                      text: "Ambulantes",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const CustomIconButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 1,
              offset: const Offset(0, 1),
            )
          ]
          ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            elevation: 0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InspectionList()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 45,
            ),
            const SizedBox(height: 15),
            Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
