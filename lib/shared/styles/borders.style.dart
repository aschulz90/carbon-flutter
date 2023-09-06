import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class CarbonStateBorder extends Border implements MaterialStateProperty<Border> {
  const CarbonStateBorder({
    required this.color,
    required this.width,
    this.animationDuration = const Duration(milliseconds: 0),
    this.animationCurve = Curves.easeInOut,
  });

  CarbonStateBorder.zero()
      : animationDuration = const Duration(milliseconds: 0),
        animationCurve = Curves.easeInOut,
        color = CarbonStateColor.all(Colors.transparent),
        width = MaterialStatePropertyAll(0);

  final CarbonStateColor color;
  final MaterialStateProperty<double> width;

  final Duration animationDuration;
  final Curve animationCurve;

  @override
  BorderSide get top => BorderSide(
        color: color,
        width: width.resolve({}),
      );

  @override
  BorderSide get bottom => BorderSide(
        color: color,
        width: width.resolve({}),
      );

  @override
  BorderSide get left => BorderSide(
        color: color,
        width: width.resolve({}),
      );

  @override
  BorderSide get right => BorderSide(
        color: color,
        width: width.resolve({}),
      );

  @override
  Border resolve(Set<MaterialState> states) {
    return Border.all(color: color.resolve(states), width: width.resolve(states));
  }

  CarbonStateBorder copyWith({
    CarbonStateColor? color,
    MaterialStateProperty<double>? width,
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
