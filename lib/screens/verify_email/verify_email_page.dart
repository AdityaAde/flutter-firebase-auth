import 'package:flutter/material.dart';

import 'widget/verify_email_body.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({Key? key}) : super(key: key);

  static const String routeName = '/verify-email';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const VerifyEmailScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const VerifyEmailBody();
  }
}
