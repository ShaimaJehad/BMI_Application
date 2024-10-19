import 'package:bmi/utils/constant.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton(
      {super.key, required this.onTap, required this.calculateText});
  final Function() onTap;
  final String calculateText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          child: Center(
            child: Text(
              calculateText,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          color: kBottomContainerColour,
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: kBottomContainerHeight,
        ));
  }
}
