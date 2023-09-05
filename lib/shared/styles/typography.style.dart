import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

abstract class CTypography {
  static const cTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon_flutter'),
    displayMedium: TextStyle(fontFamily: CFonts.primaryLight, package: 'carbon_flutter'),
    displaySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    headlineLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    headlineMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    headlineSmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    titleLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    titleMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    titleSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon_flutter'),
    bodyLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    bodyMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    bodySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: 'carbon_flutter'),
    labelSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: 'carbon_flutter'),
  );
}
