import 'package:flutter/material.dart';

class StablismentScreen extends StatelessWidget {
  const StablismentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("inspecciones"),
      ),
      body: const Text("Inspecciones asignadas "),
    );
  }
}
