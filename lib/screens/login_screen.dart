import 'package:flutter/material.dart';
import 'package:inspection_app/models/login_model.dart';
import 'package:inspection_app/widget/custom_show_dialog.dart';
import 'package:inspection_app/services/use_service.dart';
import 'package:inspection_app/widget/custom_button.dart';
import 'package:inspection_app/widget/general_input_fiel.dart';
import 'package:inspection_app/widget/navigation_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _password = TextEditingController();
  final _userFocus = FocusNode();
  final _passFocus = FocusNode();
  bool _isLoading = false;
  @override
  void dispose() {
    _user.dispose();
    _password.dispose();
    _userFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void showDialog(String message) {
      FocusScope.of(context).requestFocus(FocusNode());
      FocusScope.of(context).unfocus();
      Future.delayed(const Duration(milliseconds: 50), () {
        CustomShowDialog.show(
            context: context,
            title: 'Error',
            content: message,
            dismissible: true,
            icon: Icons.error_outline,
            iconColor: Colors.red);
      });
    }

    void goTo() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const CustomNavigationBar()));
    }

    void getUser() async {
      final res = await UseService.getUser();
      if (res['data'] != null) {
        print("usuario ${res['data']}");
        //final user = UserModel.fromJson(res['data']);
        //saveUser(user);
      }
    }

    void submitForm() async {
      if (formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        FocusScope.of(context).unfocus();
        final res = await UseService.loginUser(_user.text, _password.text);
        setState(() {
          _isLoading = false;
        });
        if (res['data'] != null) {
          final loginResponse = LoginModel.fromJsom(res['data']);
          saveToken(loginResponse.token);
          getUser();
          goTo();
        } else {
          _user.clear();
          _password.clear();
          showDialog(res['error']);
        }
      }
    }

    return Scaffold(
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
                          controller: _user,
                          hintText: "Usuario",
                          icon: Icons.person,
                          isPassword: false,
                          focus: _userFocus,
                        ),
                        GeneralInputField(
                          controller: _password,
                          hintText: "Contraseña",
                          icon: Icons.lock_rounded,
                          isPassword: true,
                          focus: _passFocus,
                        ),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
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
