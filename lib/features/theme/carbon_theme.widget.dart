import 'package:carbon_flutter/features/theme/carbon_theme.style.dart';
import 'package:flutter/material.dart';

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

  static Color layerColor(BuildContext context, {int offset = 0}) {
    final theme = of(context);
    final layerIndex = CarbonThemeLayer.of(context);
    return theme.layers[(layerIndex + offset) % theme.layers.length];
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
        child: Builder(
          builder: (context) {
            return builder.call(context, newLayerIndex, newLayerColor);
          }
        ),
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
