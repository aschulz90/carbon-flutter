import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class CarbonStateBorder extends Border implements MaterialStateProperty<Border> {
  const CarbonStateBorder({
    required this.color,
    required this.width,
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.easeInOut,
  });

  final CarbonStateColor color;
  final double width;

  final Duration animationDuration;
  final Curve animationCurve;

  @override
  Border resolve(Set<MaterialState> states) {
    return Border.all(color: color.resolve(states), width: width);
  }

  CarbonStateBorder copyWith({
    CarbonStateColor? color,
    double? width,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return CarbonStateBorder(
      color: color ?? this.color,
      width: width ?? this.width,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }
}
