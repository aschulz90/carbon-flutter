import 'package:carbon_flutter/features/carbon_app/carbon_app.style.dart';
import 'package:carbon_flutter/features/checkbox/checkbox.styles.dart';
import 'package:carbon_flutter/features/icon/icon.style.dart';
import 'package:carbon_flutter/features/radio/radio.style.dart';
import 'package:carbon_flutter/features/toggle/toggle.styles.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:carbon_flutter/shared/styles/fonts.style.dart';
import 'package:carbon_flutter/shared/styles/typography.style.dart';
import 'package:flutter/material.dart';

final whiteTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: CColors.blue60,
  disabledColor: CColors.gray40,
  canvasColor: CColors.gray10,
  scaffoldBackgroundColor: CColors.white0,
  highlightColor: CColors.blue70,
  indicatorColor: CColors.blue70,
  hintColor: CColors.gray10,
  focusColor: CColors.blue60,
  unselectedWidgetColor: CColors.gray100,
  fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
  iconTheme: iconThemeLight,
  appBarTheme: appBarTheme,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: CColors.gray90,
    selectionColor: CColors.blue70,
    selectionHandleColor: CColors.blue70,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: CColors.gray10,
    labelStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray60,
    ),
    helperStyle: TextStyle(
      fontSize: 14.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray60,
    ),
    hintStyle: TextStyle(
      fontSize: 15.0,
      fontFamily: CFonts.primaryRegular,
      color: CColors.gray40,
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
    displayColor: CColors.gray90,
    bodyColor: CColors.gray90,
  ),
  checkboxTheme: checkboxTheme(
    selected: CColors.gray100,
    cursor: CColors.white0,
  ),
  switchTheme: switchTheme(
    disabledTrackColor: CColors.gray10,
    disabledThumbColor: CColors.gray30,
  ),
  radioTheme: radioThemeLight,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: CColors.blue60,
    onPrimary: CColors.white0,
    secondary: CColors.gray100,
    onSecondary: CColors.white0,
    tertiary: CColors.gray10,
    onTertiary: CColors.blue60,
    background: CColors.white0,
    onBackground: CColors.gray100,
    error: CColors.red60,
  ),
);
