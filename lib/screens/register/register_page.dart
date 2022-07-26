import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widget/form_registration.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CanvasBackgorundImage(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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
                const FormRegistration(),
                const SizedBox(height: 24),
                _alreadyHaveAnAccount(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _alreadyHaveAnAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white),
        text: 'Already Have an Account? ',
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onClickedSignIn,
            text: 'Sign In',
            style: TextStyle(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ],
      ),
    );
  }
}
