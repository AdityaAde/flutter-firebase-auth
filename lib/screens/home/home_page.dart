import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: CanvasBackgorundImage(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Signed In As', style: textTheme.displayMedium),
            const SizedBox(height: 8),
            Text(
              user.email!,
              style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 50),
            ButtonCustom(
              buttonText: 'Sign Out',
              onPressed: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      )),
    );
  }
}
