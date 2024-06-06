import 'package:flutter/material.dart';

class GeneralInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final Icon? suffixIcon;
  final FocusNode focus;
  const GeneralInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.isPassword,
    required this.focus,
    this.suffixIcon,
  });

  @override
  State<GeneralInputField> createState() => _GeneralInputFieldState();
}

class _GeneralInputFieldState extends State<GeneralInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          autofocus: true,
          focusNode: widget.focus,
          obscureText: widget.isPassword ? _obscureText : false,
          controller: widget.controller,
          decoration: InputDecoration(
              prefixIcon: Icon(
                widget.icon,
                size: 18,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ))
                  : widget.suffixIcon,

              //prefixIconColor: Colors.white,
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: Colors.black, fontSize: 16),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gapPadding: 3),
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              contentPadding: const EdgeInsets.all(2)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Ingrese los datos correspondientes';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
