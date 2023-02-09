import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui_desing_demo/screens/LandingPage.dart';
import 'package:flutter_ui_desing_demo/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Ui - Desing Demo',
        theme: ThemeData(primaryColor: COLOR_WHITE,
            accentColor: COLOR_DARK_BLUE,
            textTheme: screenWidth < 500
                ? TEXT_THEME_SMALL
                : TEXT_THEME_DEFAULT,
            // fontFamily: "coolvetica"
        ),
        home: LandingPage(),
    );
  }
}
