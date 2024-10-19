import 'package:bmi/utils/constant.dart';
import 'package:bmi/widgets/cal_button.dart';
import 'package:bmi/widgets/my_card.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2(
      {super.key,
      required this.ResultNum,
      required this.ResultText,
      required this.message});
  final String ResultNum;
  final String ResultText;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: const Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              onPress: () {},
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ResultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    ResultNum,
                    style: kBMITextStyle,
                  ),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            calculateText: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
