import 'package:flutter/material.dart';

class AppBarImages extends StatelessWidget {
  const AppBarImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/assets/cocha-logo.png',
          height: 130,
          width: 100,
        ),
        Image.asset(
          'lib/assets/government-logoo.png',
          height: 130,
          width: 130,
        ),
        Image.asset(
          'lib/assets/sedes-logo.png',
          width: 60,
          height: 80,
        ),
      ],
    );
  }
}
