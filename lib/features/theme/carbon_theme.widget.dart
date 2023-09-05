import 'package:carbon_flutter/features/button/button.styles.dart';
import 'package:carbon_flutter/shared/enums/index.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
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
}

class CarbonThemeData {
  final CTheme style;

  final List<Color> layers;
  final List<Color> onLayers;
  final CarbonButtonTheme buttonTheme;

  CarbonThemeData({
    required this.style,
    required this.layers,
    required this.onLayers,
  }) : buttonTheme = lightButtonTheme;

  CarbonThemeData.white()
      : style = CTheme.white,
        buttonTheme = lightButtonTheme,
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
        buttonTheme = lightButtonTheme,
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
        buttonTheme = darkButtonTheme,
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
        buttonTheme = darkButtonTheme,
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
}

class CarbonTheme extends StatelessWidget {
  final MaterialStateOutlineInputBorder? border = null;

  const CarbonTheme({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final CarbonThemeData data;

  static CarbonThemeData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CarbonThemeInherited>()?.data ?? CarbonThemeData.white();
  }

  static Color layerColor(BuildContext context) {
    final theme = of(context);
    final layerIndex = CarbonThemeLayer.of(context);
    return theme.layers[layerIndex];
  }

  @override
  Widget build(BuildContext context) {
    return _CarbonThemeInherited(
      data: data,
      child: CarbonThemeLayer(
        layerIndex: 0,
        builder: (_, __, ___) => child,
      ),
    );
  }
}

class _CarbonThemeInherited extends InheritedWidget {
  const _CarbonThemeInherited({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  final CarbonThemeData data;

  @override
  bool updateShouldNotify(_CarbonThemeInherited oldWidget) => data != oldWidget.data;
}

class CarbonThemeLayer extends StatelessWidget {
  const CarbonThemeLayer({super.key, this.layerIndex, required this.builder});

  final int? layerIndex;
  final Widget Function(BuildContext context, int layerIndex, Color layerColor) builder;

  static int of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CarbonThemeLayerInherited>()?.layerIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final newLayerIndex = layerIndex ?? CarbonThemeLayer.of(context) + 1;
    final newLayerColor = CarbonTheme.of(context).layers[newLayerIndex];
    final newNextLayerColor = CarbonTheme.of(context).layers[newLayerIndex + 1];
    final theme = Theme.of(context);
    return _CarbonThemeLayerInherited(
      layerIndex: newLayerIndex,
      child: Theme(
        data: theme.copyWith(
          inputDecorationTheme: theme.inputDecorationTheme.copyWith(
            fillColor: newNextLayerColor,
          ),
          canvasColor: newLayerColor,
          colorScheme: theme.colorScheme.copyWith(
            background: newLayerColor,
            surface: newNextLayerColor,
          ),
        ),
        child: builder.call(context, newLayerIndex, newLayerColor),
      ),
    );
  }
}

class _CarbonThemeLayerInherited extends InheritedWidget {
  const _CarbonThemeLayerInherited({
    Key? key,
    required this.layerIndex,
    required Widget child,
  }) : super(key: key, child: child);

  final int layerIndex;

  @override
  bool updateShouldNotify(_CarbonThemeLayerInherited oldWidget) => false;
}
