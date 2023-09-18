import 'package:carbon_flutter/features/carbon_app/carbon_app.style.dart';
import 'package:carbon_flutter/features/checkbox/checkbox.styles.dart';
import 'package:carbon_flutter/features/icon/icon.style.dart';
import 'package:carbon_flutter/features/radio/radio.style.dart';
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
  unselectedWidgetColor: CColors.white0,
  hintColor: CColors.gray10,
  fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
  iconTheme: iconThemeDark,
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
    errorStyle: TextStyle(
      fontSize: 12.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.red60,
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
  radioTheme: radioThemeDark,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
  ).copyWith(
    primary: CColors.blue60,
    onPrimary: CColors.white0,
    secondary: CColors.white0,
    onSecondary: CColors.gray100,
    tertiary: CColors.gray90,
    onTertiary: CColors.white0,
    background: CColors.gray100,
    onBackground: CColors.white0,
    error: CColors.red60,
  ),
);