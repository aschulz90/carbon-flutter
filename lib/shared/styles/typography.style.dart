import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

const TextStyle _defaultStyle = TextStyle(
  package: assetsPackage,
  fontWeight: FontWeight.w400,
);

abstract class CTypography {
  static final cTextTheme = TextTheme(
    displayLarge: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryLight,
      fontSize: 57,
    ),
    displayMedium: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryLight,
      fontSize: 45,
    ),
    displaySmall: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 36,
    ),
    headlineLarge: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 32,
    ),
    headlineMedium: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 28,
    ),
    headlineSmall: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 24,
    ),
    titleLarge: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 22,
    ),
    titleMedium: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryMedium,
      fontSize: 14,
    ),
    bodyLarge: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 16,
    ),
    bodyMedium: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 14,
    ),
    bodySmall: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryRegular,
      fontSize: 12,
    ),
    labelLarge: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryMedium,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryMedium,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _defaultStyle.copyWith(
      fontFamily: CFonts.primaryMedium,
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ),
  );
}
