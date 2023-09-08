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

class CarbonThemeData {
  final CTheme style;

  final List<Color> layers;
  final List<Color> onLayers;
  final CarbonButtonTheme buttonTheme;
  final CarbonNotificationTheme notificationTheme;
  final ThemeData materialTheme;

  CarbonThemeData.white()
      : style = CTheme.white,
        materialTheme = whiteTheme,
        buttonTheme = lightButtonTheme,
        notificationTheme = lightNotificationTheme,
        layers = const [
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
        ],
        onLayers = const [];

  CarbonThemeData.gray10()
      : style = CTheme.gray10,
        materialTheme = gray10Theme,
        buttonTheme = lightButtonTheme,
        notificationTheme = lightNotificationTheme,
        layers = const [
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
          CColors.gray10,
          CColors.white0,
        ],
        onLayers = const [];

  CarbonThemeData.gray90()
      : style = CTheme.gray90,
        materialTheme = gray90Theme,
        buttonTheme = darkButtonTheme,
        notificationTheme = darkNotificationTheme,
        layers = const [
          CColors.gray90,
          CColors.gray80,
          CColors.gray70,
          CColors.gray60,
          CColors.gray50,
          CColors.gray40,
          CColors.gray30,
          CColors.gray20,
          CColors.gray10,
          CColors.white0,
        ],
        onLayers = const [];

  CarbonThemeData.gray100()
      : style = CTheme.gray100,
        materialTheme = gray100Theme,
        buttonTheme = darkButtonTheme,
        notificationTheme = darkNotificationTheme,
        layers = const [
          CColors.gray100,
          CColors.gray90,
          CColors.gray80,
          CColors.gray70,
          CColors.gray60,
          CColors.gray50,
          CColors.gray40,
          CColors.gray30,
          CColors.gray20,
          CColors.gray10,
          CColors.white0,
        ],
        onLayers = const [];

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarbonThemeData &&
          runtimeType == other.runtimeType &&
          style == other.style &&
          layers == other.layers &&
          onLayers == other.onLayers &&
          buttonTheme == other.buttonTheme &&
          notificationTheme == other.notificationTheme;

  @override
  int get hashCode => style.hashCode ^ layers.hashCode ^ onLayers.hashCode ^ buttonTheme.hashCode ^ notificationTheme.hashCode;
}
