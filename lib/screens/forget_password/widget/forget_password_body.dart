// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../widgets/widgets.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
        backgroundColor: Colors.black.withOpacity(0.8),
      ),
      body: SingleChildScrollView(
        child: CanvasBackgorundImage(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Masukan Email yang terdaftar untuk melakukan reset pada password',
                  style: theme.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                FormFieldCustom(
                  labelText: 'Email',
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                ),
                const SizedBox(height: 20),
                ButtonCustom(
                  buttonText: 'Reset Password',
                  onPressed: resetPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      );

      Utils.showSnackBar('setel ulang kata sandi telah terkirim ke email');
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException {
      Utils.showSnackBar('Masukan Email');
      Navigator.of(context).pop();
    }
  }
}
