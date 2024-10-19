import 'package:bmi/pages/screen1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xFFC58AA6),
          scaffoldBackgroundColor: Color.fromRGBO(56, 62, 138, 0.988),
          appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(),
            elevation: 0,
            backgroundColor: Color.fromARGB(10, 14, 49, 255),
          ),
        ),
        home: Screen1());
  }
}
