import 'package:flutter/material.dart';

import '../login/widget/login_widget.dart';
import '../register/register_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginWidget(onClickedSignUp: toogle) : RegisterScreen(onClickedSignIn: toogle);

  void toogle() => setState(() => isLogin = !isLogin);
}
