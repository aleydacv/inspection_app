import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inspection_app/services/use_service.dart';
import 'package:inspection_app/widget/custom_button.dart';
import 'package:inspection_app/widget/general_input_fiel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final user = TextEditingController();
    final password = TextEditingController();
    void submitForm() async {
      if (formKey.currentState!.validate()) {
        final res = await UseService.loginUser(user.text, password.text);
        print("Data: ${res['data']}");
        print("error: ${res['error']}");
      }
    }

    return Scaffold(
      //backgroundColor: Colors.indigoAccent.shade100,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.blue.shade100,
            const Color.fromRGBO(156, 157, 204, 1.0),
            Colors.indigo.shade400,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
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
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GeneralInputField(
                          controller: user,
                          hintText: "Usuario",
                          icon: Icons.person,
                          isPassword: false,
                        ),
                        GeneralInputField(
                          controller: password,
                          hintText: "Contraseña",
                          icon: Icons.lock_rounded,
                          isPassword: true,
                        ),
                        CustomButton(
                            title: 'Iniciar',
                            onPressed: submitForm,
                            colorButton: Colors.black,
                            colorText: Colors.white)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
