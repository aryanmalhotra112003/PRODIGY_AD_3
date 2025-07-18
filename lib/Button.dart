import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          elevation: 15,
          fixedSize: Size(100, 70),
          backgroundColor: Colors.white,
          iconColor: Colors.brown),
      onPressed: onPressed,
      child: icon,
    );
  }
}
