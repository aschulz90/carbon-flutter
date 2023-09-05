import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

abstract class CTypography {
  static const cTextTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: CFonts.primaryLight, package: assetsPackage),
    displayMedium: TextStyle(fontFamily: CFonts.primaryLight, package: assetsPackage),
    displaySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    headlineLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    headlineMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    headlineSmall: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    titleLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    titleMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    titleSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: assetsPackage),
    bodyLarge: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    bodyMedium: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    bodySmall: TextStyle(fontFamily: CFonts.primaryRegular, package: assetsPackage),
    labelSmall: TextStyle(fontFamily: CFonts.primaryMedium, package: assetsPackage),
  );
}
