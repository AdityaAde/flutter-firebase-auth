import 'package:application_login/screens/forget_password/widget/forget_password_body.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = '/forget-password';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ForgetPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ForgetPasswordBody(),
    );
  }
}
