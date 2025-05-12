import 'package:flutter/material.dart';
import 'package:inspection_app/themes/app_theme.dart';
import 'package:inspection_app/widget/app_bar_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarImages(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Datos Personales",
              style: AppTheme().titleStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Card(
                color: Colors.grey.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nombre(s):", style: AppTheme().dataStyle()),
                      const Divider(),
                      Text("Apellidos:", style: AppTheme().dataStyle()),
                      const Divider(),
                      Text("Ci:", style: AppTheme().dataStyle()),
                      const Divider(),
                      Text("Celular:", style: AppTheme().dataStyle()),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
