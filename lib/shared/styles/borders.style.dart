import 'package:flutter/material.dart';

class CarbonStateBorder extends Border implements MaterialStateProperty<Border> {
  const CarbonStateBorder({
    this.color = Colors.transparent,
    required this.enabledColor,
    required this.width,
  });

  final Color color;
  final Color enabledColor;
  final double width;

  @override
  Border resolve(Set<MaterialState> states) {
    if (states.intersection({
      MaterialState.focused,
      MaterialState.pressed,
    }).isNotEmpty) {
      return Border.all(color: enabledColor, width: width);
    }

    return Border.all(color: color, width: 0);
  }
}