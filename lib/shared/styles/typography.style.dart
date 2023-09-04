import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

abstract class CTypography {
  static const cTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon'),
    displayMedium: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon'),
    displaySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headlineLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headlineMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    headlineSmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    titleLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    titleMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    titleSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon'),
    bodyLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    bodyMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    bodySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon'),
    labelSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon'),
  );
}
