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
    final width = this.width.resolve(states);
    final color = this.color.resolve(states);
    final showBorder = width > 0 && color.alpha > 0;
    return Border.all(
      color: color,
      width: width,
      style: showBorder ? BorderStyle.solid : BorderStyle.none,
    );
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CarbonStateBorder &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          width == other.width &&
          animationDuration == other.animationDuration &&
          animationCurve == other.animationCurve;

  @override
  int get hashCode => super.hashCode ^ color.hashCode ^ width.hashCode ^ animationDuration.hashCode ^ animationCurve.hashCode;
}
