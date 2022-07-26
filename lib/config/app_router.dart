import 'package:application_login/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return LoginScreen.route();
      case '/register':
        return RegisterScreen.route();
      case '/verify-email':
        return VerifyEmailScreen.route();
      case '/home':
        return HomeScreen.route();
      case '/forget-password':
        return ForgetPasswordScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Something went worng'),
        ),
      ),
    );
  }
}
