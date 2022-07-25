import 'package:flutter/material.dart';

class CanvasBackgorundImage extends StatelessWidget {
  final Widget child;
  const CanvasBackgorundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/wallpaper.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
