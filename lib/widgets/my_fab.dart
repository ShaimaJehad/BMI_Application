import 'package:flutter/material.dart';

class MyFab extends StatelessWidget {
  const MyFab({super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(minHeight: 36, minWidth: 36),
      padding: EdgeInsets.all(8),
      fillColor: Color.fromRGBO(127, 132, 199, 0.675),
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
