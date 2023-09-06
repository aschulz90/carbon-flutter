import 'package:carbon_flutter/features/carbon_app/carbon_app.style.dart';
import 'package:carbon_flutter/features/checkbox/checkbox.styles.dart';
import 'package:carbon_flutter/features/toggle/toggle.styles.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:carbon_flutter/shared/styles/fonts.style.dart';
import 'package:carbon_flutter/shared/styles/typography.style.dart';
import 'package:flutter/material.dart';

final gray100Theme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: CColors.blue60,
  disabledColor: CColors.gray40,
  canvasColor: CColors.gray90,
  scaffoldBackgroundColor: CColors.gray100,
  highlightColor: CColors.blue70,
  indicatorColor: CColors.blue70,
  focusColor: CColors.blue60,
  hintColor: CColors.gray10,
  fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
  iconTheme: IconThemeData(color: CColors.gray10),
  appBarTheme: appBarTheme.copyWith(
    shape: Border(
      bottom: BorderSide(
        color: CColors.gray50,
        width: 1,
      ),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CColors.gray10,
    selectionColor: CColors.blue70,
    selectionHandleColor: CColors.blue70,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: CColors.gray90,
    labelStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray30,
    ),
    helperStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray30,
    ),
    hintStyle: TextStyle(
      fontSize: 15.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray60,
    ),
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.gray60, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.blue60, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.red60, width: 2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(color: CColors.blue60, width: 2),
    ),
    disabledBorder: InputBorder.none,
    iconColor: CColors.gray10,
  ),
  textTheme: CTypography.cTextTheme.apply(
    displayColor: CColors.gray10,
    bodyColor: CColors.gray10,
  ),
  checkboxTheme: checkboxTheme(
    selected: CColors.white0,
    cursor: CColors.gray90,
  ),
  switchTheme: switchTheme(),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(
    primary: CColors.blue60,
    onPrimary: CColors.white0,
    secondary: CColors.gray70,
    onSecondary: CColors.white0,
    tertiary: CColors.white0,
    onTertiary: CColors.blue60,
    background: CColors.gray100,
    error: CColors.red60,
  ),
);