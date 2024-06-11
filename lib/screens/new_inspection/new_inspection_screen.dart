import 'package:flutter/material.dart';
import 'package:inspection_app/screens/new_inspection/components/assigned_inspections/inspection_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inspection_app/themes/app_theme.dart';
import 'package:inspection_app/widget/app_bar_images.dart';

class NewInspectionScreen extends StatelessWidget {
  const NewInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const AppBarImages(),
        ),
        //backgroundColor: const Color(0xFFF6F5FA),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Realice una Inspeccion",
                  style: AppTheme().titleStyle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
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
      width: 0.43.sw,
      height: 0.2.sh,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 1,
          offset: const Offset(0, 1),
        )
      ]),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade50,
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
              size: 35,
              color: Colors.grey.shade700,
            ),
            const SizedBox(height: 15),
            Text(
              text,
              style: const TextStyle(color: Colors.black45, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
