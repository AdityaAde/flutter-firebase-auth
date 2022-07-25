import 'package:flutter/material.dart';

class FormFieldCustom extends StatelessWidget {
  const FormFieldCustom({
    Key? key,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.autovalidateMode,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      controller: controller,
      cursorColor: Colors.white,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: obscureText,
      autovalidateMode: autovalidateMode,
      validator: validator,
    );
  }
}
