import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../main.dart';
import '../../../widgets/widgets.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key, required this.onClickedSignUp}) : super(key: key);

  final VoidCallback onClickedSignUp;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: CanvasBackgorundImage(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontFamily: 'AnginSenja',
                        fontSize: 90,
                      ),
                ),
                FormFieldCustom(
                  labelText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 20),
                FormFieldCustom(
                  labelText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ButtonCustom(
                  buttonText: 'Sign In',
                  onPressed: signIn,
                ),
                const SizedBox(height: 24),
                InkWell(
                  child: Text(
                    'Forgot Password?',
                    style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      color: theme.colorScheme.background,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/forget-password');
                  },
                ),
                const SizedBox(height: 10),
                RichText(
                    text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  text: 'No Account? ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                      text: 'Sign Up',
                      style: TextStyle(
                        color: theme.colorScheme.background,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
