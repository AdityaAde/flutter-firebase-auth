import 'package:flutter/material.dart';

import '../../register/register_page.dart';
import 'login_body.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginBody(onClickedSignUp: toogle) : RegisterScreen(onClickedSignIn: toogle);

  void toogle() => setState(() => isLogin = !isLogin);
}
