import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/stablisment/stablisment_screen.dart';

class NewInspectionScreen extends StatelessWidget {
  const NewInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("el titulo aqui"),
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Realice una Inspeccion",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomIconButton(icon: Icons.storefront),
                    SizedBox(
                      width: 50,
                    ),
                    CustomIconButton(icon: Icons.beach_access_outlined),
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
  const CustomIconButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StablismentScreen()),
          );
        },
        child: Icon(
          icon,
          size: 60,
        ),
      ),
    );
  }
}
