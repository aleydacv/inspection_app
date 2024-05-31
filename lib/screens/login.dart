import 'package:flutter/material.dart';
import 'package:inspection_app/widget/general_input_fiel.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final user = TextEditingController();
    final password = TextEditingController();
    return Scaffold(
      //backgroundColor: Colors.indigoAccent.shade100,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.shade100,
            Colors.indigo.shade400,
            Color.fromARGB(156, 157, 204, 228)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_circle, size: 70, color: Colors.white),
              const Text(
                "Iniciar Sesión",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              GeneralInputField(
                  controller: user, hintText: "Usuario", icon: Icons.person),
              const SizedBox(
                height: 20,
              ),
              GeneralInputField(
                  controller: password,
                  hintText: "Contraseña",
                  icon: Icons.lock_rounded),
            ],
          ),
        ),
      ),
    );
  }
}
