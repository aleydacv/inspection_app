import 'package:flutter/material.dart';

class CustomShowDialog {
  static void show(
      {required BuildContext context,
      required String title,
      required String content,
      IconData? icon,
      Color? iconColor,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          icon,
          size: 50,
        ),
        iconColor: iconColor,
        title: Text(title),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}
