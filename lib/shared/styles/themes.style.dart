import 'package:carbon_flutter/carbon.dart';

import 'package:flutter/material.dart';

class CThemes {
  static ThemeData getTheme(CTheme theme) => switch (theme) {
        CTheme.white => _white,
        CTheme.gray10 => _gray10,
        CTheme.gray90 => _gray90,
        CTheme.gray100 => _gray100,
      };

  static final AppBarTheme _appBarTheme = AppBarTheme(
    elevation: 0,
    shape: Border(
      bottom: BorderSide(
        color: CColors.gray90,
        width: 2,
      ),
    ),
  );

  static final _white = ThemeData(
    brightness: Brightness.light,
    primaryColor: CColors.blue60,
    disabledColor: CColors.gray10,
    canvasColor: CColors.gray10,
    scaffoldBackgroundColor: CColors.white0,
    highlightColor: CColors.blue70,
    indicatorColor: CColors.blue70,
    hintColor: CColors.gray10,
    fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
    iconTheme: IconThemeData(color: CColors.gray10),
    appBarTheme: _appBarTheme.copyWith(
      color: CColors.gray100,
    ),
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
        borderSide: BorderSide(color: CColors.red50, width: 2),
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: CColors.gray70,
      background: CColors.white0,
      error: CColors.red40,
    ),
  );

  static final _gray10 = ThemeData(
    brightness: Brightness.light,
    primaryColor: CColors.blue60,
    disabledColor: CColors.gray10,
    canvasColor: CColors.white0,
    scaffoldBackgroundColor: CColors.gray10,
    highlightColor: CColors.blue70,
    indicatorColor: CColors.blue70,
    hintColor: CColors.gray10,
    fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
    iconTheme: IconThemeData(color: CColors.gray10),
    appBarTheme: _appBarTheme.copyWith(
      color: CColors.gray100,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CColors.gray90,
      selectionColor: CColors.blue70,
      selectionHandleColor: CColors.blue70,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CColors.gray10,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      labelStyle: TextStyle(
        fontSize: 14.0,
        fontFamily: CFonts.primaryRegular,
        color: CColors.gray70,
      ),
      helperStyle: TextStyle(
        fontSize: 14.0,
        fontFamily: CFonts.primaryRegular,
        color: CColors.gray70,
      ),
      hintStyle: TextStyle(
        fontSize: 15.0,
        fontFamily: CFonts.primaryRegular,
        color: CColors.gray30,
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
        borderSide: BorderSide(color: CColors.red50, width: 2),
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
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: CColors.gray70,
      background: CColors.gray10,
      error: CColors.red40,
    ),
  );

  static final _gray90 = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CColors.blue60,
    disabledColor: CColors.gray10,
    canvasColor: CColors.gray80,
    scaffoldBackgroundColor: CColors.gray90,
    highlightColor: CColors.blue70,
    indicatorColor: CColors.blue70,
    hintColor: CColors.gray10,
    fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
    iconTheme: IconThemeData(color: CColors.gray10),
    appBarTheme: _appBarTheme.copyWith(
      color: CColors.gray100,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: CColors.gray10,
      selectionColor: CColors.blue70,
      selectionHandleColor: CColors.blue70,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: CColors.gray80,
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
        borderSide: BorderSide(color: CColors.red50, width: 2),
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
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(
      secondary: CColors.gray70,
      background: CColors.gray90,
      error: CColors.red40,
    ),
  );

  static final _gray100 = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CColors.blue60,
    disabledColor: CColors.gray10,
    canvasColor: CColors.gray90,
    scaffoldBackgroundColor: CColors.gray100,
    highlightColor: CColors.blue70,
    indicatorColor: CColors.blue70,
    hintColor: CColors.gray10,
    fontFamily: 'packages/carbon_flutter/${CFonts.primaryRegular}',
    iconTheme: IconThemeData(color: CColors.gray10),
    appBarTheme: _appBarTheme.copyWith(
      color: CColors.gray100,
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
        borderSide: BorderSide(color: CColors.red50, width: 2),
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
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(
      secondary: CColors.gray70,
      background: CColors.gray100,
      error: CColors.red40,
    ),
  );
}
