import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:flutter/material.dart';

class CLayer extends StatelessWidget {
  const CLayer({super.key, this.layerIndex, required this.builder});

  final int? layerIndex;
  final Widget Function(BuildContext context, int layerIndex, MaterialStateColor layerColor) builder;

  static int of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_CarbonThemeLayerInherited>()?.layerIndex ?? 0;
  }

  static MaterialStateColor layerColor(BuildContext context, {int offset = 0}) {
    final theme = CarbonTheme.of(context);
    final layerIndex = CLayer.of(context);
    return theme.layers[(layerIndex + offset) % theme.layers.length];
  }

  static MaterialStateColor onLayerColor(BuildContext context, {int offset = 0}) {
    final theme = CarbonTheme.of(context);
    final layerIndex = CLayer.of(context);
    return theme.onLayers[(layerIndex + offset) % theme.onLayers.length];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final carbonTheme = CarbonTheme.of(context);
    final newLayerIndex = (layerIndex ?? CLayer.of(context) + 1) % carbonTheme.layers.length;
    final newLayerColor = carbonTheme.layers[newLayerIndex];
    final newNextLayerColor = carbonTheme.layers[(newLayerIndex + 1) % carbonTheme.layers.length];

    return _CarbonThemeLayerInherited(
      layerIndex: newLayerIndex,
      child: Theme(
        data: theme.copyWith(
          inputDecorationTheme: theme.inputDecorationTheme.copyWith(
            fillColor: newNextLayerColor,
            hintStyle: TextStyle(
              color: newNextLayerColor.resolve({MaterialState.pressed}),
            ),
          ),
          canvasColor: newLayerColor,
          colorScheme: theme.colorScheme.copyWith(
            background: newLayerColor,
            surface: newNextLayerColor,
          ),
        ),
        child: Builder(builder: (context) {
          return builder.call(context, newLayerIndex, newLayerColor);
        }),
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
