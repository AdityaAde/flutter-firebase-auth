import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../config/config.dart';
import '../../../main.dart';
import '../../../widgets/widgets.dart';

class FormRegistration extends StatefulWidget {
  const FormRegistration({Key? key}) : super(key: key);

  @override
  State<FormRegistration> createState() => _FormRegistrationState();
}

class _FormRegistrationState extends State<FormRegistration> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameValidator = MultiValidator([
      RequiredValidator(errorText: 'name is required'),
      MinLengthValidator(3, errorText: 'password must be at least 3 digits long'),
      MaxLengthValidator(50, errorText: 'maximal 50 digits'),
    ]);
    final emailValidator = MultiValidator([
      RequiredValidator(errorText: 'password is required'),
      EmailValidator(errorText: 'enter a valid email'),
    ]);
    final passwordValidator = MultiValidator([
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
      PatternValidator('.*[a-z].*', errorText: 'Input harus berisi huruf kecil'),
      PatternValidator('.*[A-Z].*', errorText: 'Input harus berisi huruf besar'),
    ]);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormFieldCustom(
            labelText: 'Name',
            controller: nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: nameValidator,
          ),
          const SizedBox(height: 20),
          FormFieldCustom(
            labelText: 'Email',
            controller: emailController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: emailValidator,
          ),
          const SizedBox(height: 20),
          FormFieldCustom(
            labelText: 'Password',
            controller: passwordController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: passwordValidator,
          ),
          const SizedBox(height: 20),
          FormFieldCustom(
            labelText: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              final matchValidator =
                  MatchValidator(errorText: 'passwords tidak cocok').validateMatch(value!, passwordController.text);
              if (value.isEmpty) {
                return 'password required';
              } else {
                return matchValidator;
              }
            },
          ),
          const SizedBox(height: 20),
          ButtonCustom(
            buttonText: 'Sign Up',
            onPressed: signUp,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Future signUp() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
