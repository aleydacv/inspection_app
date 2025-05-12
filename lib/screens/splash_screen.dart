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
      Future.delayed(const Duration(
        seconds: 50,
      ));
      print("llega aqui: $token");
      //Aqui se cambia por login
      /*final nextRoute = token != null
          ? const CustomNavigationBar()
          : const LoginScreen();*/
      final nextRoute = token != null
          ? const CustomNavigationBar()
          : const CustomNavigationBar();

      goTo(nextRoute);
    }

    verifiedSesion();

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
