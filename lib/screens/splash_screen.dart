import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inspection_app/models/login_model.dart';
import 'package:inspection_app/screens/login_screen.dart';
import 'package:inspection_app/widget/navigation_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void goTo(StatefulWidget nextRoute) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => nextRoute));
    }

    Future<void> verifiedSesion() async {
      final token = await getToken();
      final nextRoute =
          token != null ? const LoginScreen() : const CustomNavigationBar();
      goTo(nextRoute);
    }

    verifiedSesion();

    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
