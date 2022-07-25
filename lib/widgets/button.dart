import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        primary: Colors.white,
      ),
      onPressed: onPressed,
      child: Text(buttonText, style: Theme.of(context).textTheme.button),
    );
  }
}
