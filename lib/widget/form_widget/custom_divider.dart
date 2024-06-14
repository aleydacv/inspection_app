import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 15),
        Divider(),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
