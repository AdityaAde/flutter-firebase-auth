import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../main.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key, this.onClickedSignIn}) : super(key: key);

  final Function()? onClickedSignIn;

  static const String routeName = '/register';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const RegisterScreen(),
    );
  }

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
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
    return Scaffold(
      body: SingleChildScrollView(
        child: CanvasBackgorundImage(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SignUp',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontFamily: 'AnginSenja',
                          fontSize: 90,
                        ),
                  ),
                  FormFieldCustom(
                    labelText: 'Email',
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
                  ),
                  const SizedBox(height: 20),
                  FormFieldCustom(
                    labelText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6 ? 'Enter min. 6 characters ' : null,
                  ),
                  const SizedBox(height: 20),
                  FormFieldCustom(
                    labelText: 'Confirm Password',
                    controller: confirmPasswordController,
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != passwordController.text ? 'Kata Sandi Tidak Cocok' : null,
                  ),
                  const SizedBox(height: 20),
                  ButtonCustom(
                    buttonText: 'Sign Up',
                    onPressed: signUp,
                  ),
                  const SizedBox(height: 24),
                  RichText(
                      text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    text: 'Already Have an Account? ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                        text: 'Sign In',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
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
