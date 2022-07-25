import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widget/login_widget.dart';
import '../screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Terjadi Kesalahan!'));
          } else if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginWidget();
          }
        });
  }
}
