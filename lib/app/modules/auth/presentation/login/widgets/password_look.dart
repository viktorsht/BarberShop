import 'package:flutter/material.dart';

class PasswordLook extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  const PasswordLook({
    super.key, 
    required this.onPressed, 
    required this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      autofocus: true,
      onPressed: onPressed, 
      icon: Icon(iconData),
    );
  }
}