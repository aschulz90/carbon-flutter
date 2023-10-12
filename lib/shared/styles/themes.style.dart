import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/shared/styles/theme.gray10.dart';
import 'package:carbon_flutter/shared/styles/theme.gray100.dart';
import 'package:carbon_flutter/shared/styles/theme.gray90.dart';
import 'package:carbon_flutter/shared/styles/theme.white.dart';

import 'package:flutter/material.dart';

final lightButtonTheme = CarbonButtonTheme(
  primary: primaryLight,
  secondary: secondaryLight,
  tertiary: tertiaryLight,
  ghost: ghostLight,
);

final darkButtonTheme = CarbonButtonTheme(
  primary: primaryDark,
  secondary: secondaryDark,
  tertiary: tertiaryDark,
  ghost: ghostDark,
);

class CarbonButtonTheme {
  final CarbonButtonStyle primary;
  final CarbonButtonStyle secondary;
  final CarbonButtonStyle tertiary;
  final CarbonButtonStyle ghost;

  const CarbonButtonTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.ghost,
  });

  CarbonButtonTheme copyWith({
    CarbonButtonStyle? primary,
    CarbonButtonStyle? secondary,
    CarbonButtonStyle? tertiary,
    CarbonButtonStyle? ghost,
  }) {
    return CarbonButtonTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      ghost: ghost ?? this.ghost,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarbonButtonTheme &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          ghost == other.ghost;

  @override
  int get hashCode => primary.hashCode ^ secondary.hashCode ^ tertiary.hashCode ^ ghost.hashCode;
}

final lightNotificationTheme = CarbonNotificationTheme(
  infoBackgroundColor: CColors.blue10,
  errorBackgroundColor: CColors.red10,
  successBackgroundColor: CColors.green10,
  warningBackgroundColor: CColors.yellow10,
  highContrastColor: CColors.coolGray90,
  highContrastContentColor: CColors.gray10,
);

final darkNotificationTheme = CarbonNotificationTheme(
  highContrastColor: CColors.gray10,
  highContrastContentColor: CColors.gray100,
);

class CarbonNotificationTheme {
  final Color? infoBackgroundColor;
  final Color? errorBackgroundColor;
  final Color? successBackgroundColor;
  final Color? warningBackgroundColor;
  final Color highContrastColor;
  final Color highContrastContentColor;

  CarbonNotificationTheme({
    this.infoBackgroundColor,
    this.errorBackgroundColor,
    this.successBackgroundColor,
    this.warningBackgroundColor,
    required this.highContrastColor,
    required this.highContrastContentColor,
  });
}

final MaterialStateColor _lightLayerColor0 = CarbonStateColor(
  color: CColors.white0,
  hoveredColor: CColors.gray20,
  focusedColor: CColors.gray20,
  pressedColor: CColors.gray30,
);

final MaterialStateColor _lightLayerColor1 = CarbonStateColor(
  color: CColors.gray10,
  hoveredColor: CColors.gray20,
  focusedColor: CColors.gray20,
  pressedColor: CColors.gray30,
);

final MaterialStateColor _darkLayerColor0 = CarbonStateColor(
  color: CColors.gray90,
  hoveredColor: CColors.gray80,
  focusedColor: CColors.gray80,
  pressedColor: CColors.gray70,
);

final MaterialStateColor _darkLayerColor1 = CarbonStateColor(
  color: CColors.gray80,
  hoveredColor: CColors.gray70,
  focusedColor: CColors.gray70,
  pressedColor: CColors.gray60,
);

final MaterialStateColor _darkLayerColor2 = CarbonStateColor(
  color: CColors.gray70,
  hoveredColor: CColors.gray60,
  focusedColor: CColors.gray60,
  pressedColor: CColors.gray50,
);

final MaterialStateColor _darkLayerColor3 = CarbonStateColor(
  color: CColors.gray60,
  hoveredColor: CColors.gray50,
  focusedColor: CColors.gray50,
  pressedColor: CColors.gray40,
);

final MaterialStateColor _darkLayerColor4 = CarbonStateColor(
  color: CColors.gray50,
  hoveredColor: CColors.gray40,
  focusedColor: CColors.gray40,
  pressedColor: CColors.gray30,
);

final MaterialStateColor _darkLayerColor5 = CarbonStateColor(
  color: CColors.gray40,
  hoveredColor: CColors.gray30,
  focusedColor: CColors.gray30,
  pressedColor: CColors.gray20,
);

final MaterialStateColor _darkLayerColor6 = CarbonStateColor(
  color: CColors.gray30,
  hoveredColor: CColors.gray20,
  focusedColor: CColors.gray20,
  pressedColor: CColors.gray10,
);

final MaterialStateColor _darkLayerColor7 = CarbonStateColor(
  color: CColors.gray20,
  hoveredColor: CColors.gray10,
  focusedColor: CColors.gray10,
  pressedColor: CColors.white0,
);

final MaterialStateColor _darkLayerColor8 = CarbonStateColor(
  color: CColors.gray10,
  hoveredColor: CColors.gray20,
  focusedColor: CColors.gray20,
  pressedColor: CColors.gray30,
);

final MaterialStateColor _darkLayerColor9 = CarbonStateColor(
  color: CColors.white0,
  hoveredColor: CColors.gray10,
  focusedColor: CColors.gray10,
  pressedColor: CColors.gray20,
);

class CarbonThemeData {
  final CTheme style;

  final List<MaterialStateColor> layers;
  final List<MaterialStateColor> onLayers;
  final CarbonButtonTheme buttonTheme;
  final CarbonNotificationTheme notificationTheme;
  final ThemeData materialTheme;

  CarbonThemeData({
    required this.style,
    required this.layers,
    required this.onLayers,
    required this.buttonTheme,
    required this.notificationTheme,
    required this.materialTheme,
  });

  CarbonThemeData.white()
      : style = CTheme.white,
        materialTheme = whiteTheme,
        buttonTheme = lightButtonTheme,
        notificationTheme = lightNotificationTheme,
        layers = [
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
        ],
        onLayers = [
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
        ];

  CarbonThemeData.gray10()
      : style = CTheme.gray10,
        materialTheme = gray10Theme,
        buttonTheme = lightButtonTheme,
        notificationTheme = lightNotificationTheme,
        layers = [
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
          _lightLayerColor1,
          _lightLayerColor0,
        ],
        onLayers = [
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
        ];

  CarbonThemeData.gray90()
      : style = CTheme.gray90,
        materialTheme = gray90Theme,
        buttonTheme = darkButtonTheme,
        notificationTheme = darkNotificationTheme,
        layers = [
          _darkLayerColor0,
          _darkLayerColor1,
          _darkLayerColor2,
          _darkLayerColor3,
          _darkLayerColor4,
          _darkLayerColor5,
          _darkLayerColor6,
          _darkLayerColor7,
          _darkLayerColor8,
          _darkLayerColor9,
        ],
        onLayers = [
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
        ];

  CarbonThemeData.gray100()
      : style = CTheme.gray100,
        materialTheme = gray100Theme,
        buttonTheme = darkButtonTheme,
        notificationTheme = darkNotificationTheme,
        layers = [
          CarbonStateColor(
            color: CColors.gray100,
            hoveredColor: CColors.gray90,
            focusedColor: CColors.gray90,
            pressedColor: CColors.gray80,
          ),
          _darkLayerColor1,
          _darkLayerColor2,
          _darkLayerColor3,
          _darkLayerColor4,
          _darkLayerColor5,
          _darkLayerColor6,
          _darkLayerColor7,
          _darkLayerColor8,
          _darkLayerColor9,
        ],
        onLayers = [
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.white0),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
          CarbonStateColor.all(CColors.gray100),
        ];

  CarbonThemeData copyWith({
    CTheme? style,
    List<MaterialStateColor>? layers,
    List<MaterialStateColor>? onLayers,
    CarbonButtonTheme? buttonTheme,
    CarbonNotificationTheme? notificationTheme,
    ThemeData? materialTheme,
  }) {
    return CarbonThemeData(
      style: style ?? this.style,
      layers: layers ?? this.layers,
      onLayers: onLayers ?? this.onLayers,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      notificationTheme: notificationTheme ?? this.notificationTheme,
      materialTheme: materialTheme ?? this.materialTheme,
    );
  }

  CarbonThemeData withPrimaryColor(CarbonStateColor color) => CarbonThemeData(
        style: style,
        layers: layers,
        onLayers: onLayers,
        buttonTheme: buttonTheme.copyWith(
          primary: buttonTheme.primary.copyWith(
            color: color,
          ),
          tertiary: buttonTheme.tertiary.copyWith(
            color: color.copyWith(
              color: Colors.transparent,
            ),
            contentColor: buttonTheme.tertiary.contentColor.copyWith(
              color: color,
            ),
            outerBorder: buttonTheme.tertiary.outerBorder.copyWith(
              color: color,
            ),
          ),
          ghost: buttonTheme.ghost.copyWith(
            contentColor: CarbonStateColor.all(color),
            outerBorder: buttonTheme.ghost.outerBorder.copyWith(
              color: CarbonStateColor.focus(
                materialTheme.brightness == Brightness.light ? color : CColors.white0,
                disabledColor: CColors.transparent,
              ),
            ),
          ),
        ),
        notificationTheme: notificationTheme,
        materialTheme: materialTheme.copyWith(
          colorScheme: materialTheme.colorScheme.copyWith(
            primary: color,
            onTertiary: color,
          ),
          primaryColor: color,
          focusColor: color,
          highlightColor: color.hoveredColor,
          indicatorColor: color.hoveredColor,
          textSelectionTheme: materialTheme.textSelectionTheme.copyWith(
            selectionColor: color.pressedColor,
            selectionHandleColor: color.pressedColor,
          ),
          inputDecorationTheme: materialTheme.inputDecorationTheme.copyWith(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: color, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide(color: color, width: 2),
            ),
          ),
          checkboxTheme: materialTheme.checkboxTheme.copyWith(
            side: MaterialStateBorderSide.resolveWith((states) {
              if (states.contains(MaterialState.focused)) {
                return BorderSide(
                  color: color,
                  width: 2,
                );
              }

              return BorderSide(
                color: color.resolve(states),
                width: 1,
              );
            }),
          ),
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarbonThemeData &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          layers == other.layers &&
          onLayers == other.onLayers &&
          buttonTheme == other.buttonTheme &&
          notificationTheme == other.notificationTheme &&
          materialTheme == other.materialTheme;

  @override
  int get hashCode => style.hashCode ^ layers.hashCode ^ onLayers.hashCode ^ buttonTheme.hashCode ^ notificationTheme.hashCode ^ materialTheme.hashCode;
}
