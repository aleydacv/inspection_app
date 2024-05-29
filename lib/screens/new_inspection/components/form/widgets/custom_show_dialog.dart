import 'package:flutter/material.dart';

class CustomShowDialog {
  static void show(
      {required BuildContext context,
      required String title,
      required String content,
      required bool dismissible,
      IconData? icon,
      Color? iconColor,
      VoidCallback? onPressed}) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
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
