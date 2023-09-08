import 'package:carbon_flutter/features/layer/layer.widget.dart';
import 'package:carbon_flutter/shared/styles/themes.style.dart';
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

  @override
  Widget build(BuildContext context) {
    return _CarbonThemeInherited(
      data: data,
      child: CLayer(
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

