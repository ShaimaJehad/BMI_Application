import 'package:bmi/utils/constant.dart';
import 'package:bmi/pages/screen2.dart';
import 'package:bmi/widgets/cal_button.dart';
import 'package:bmi/widgets/my_card.dart';
import 'package:bmi/widgets/my_fab.dart';
import 'package:bmi/widgets/my_icon.dart';
import 'package:flutter/material.dart';

import '../utils/bmicalcution.dart';

enum Gender {
  male,
  female,
}

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  Gender? userGender;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('BMI CALCULATOR'),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        userGender = Gender.male;
                      });
                    },
                    color: userGender == Gender.male
                        ? kInactiveCardColour
                        : kActiveCardColour,
                    child: const MyIcon(icon: Icons.male, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {
                      setState(() {
                        userGender = Gender.female;
                      });
                    },
                    color: userGender == Gender.female
                        ? kInactiveCardColour
                        : kActiveCardColour,
                    child: const MyIcon(icon: Icons.female, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              onPress: () {},
              color: kActiveCardColour,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Expanded(
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    onPress: () {},
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyFab(
                                icon: Icons.add,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            const SizedBox(width: 10),
                            MyFab(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    onPress: () {},
                    color: kActiveCardColour,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyFab(
                              icon: Icons.add,
                              onPressed: () {
                                setState(
                                  () {
                                    age++;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyFab(
                                icon: Icons.remove,
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            calculateText: 'CALCULATE YOUR BMI',
            onTap: () {
              BmiCalculation calc =
                  BmiCalculation(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen2(
                      ResultNum: calc.calculate(),
                      ResultText: calc.getResult(),
                      message: calc.getMessage(),
                    ),
                  ));
            },
          )
        ]));
  }
}
