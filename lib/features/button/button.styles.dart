import 'package:carbon_flutter/shared/styles/borders.style.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

final defaultDangerColor = CarbonStateColor(
  color: CColors.red60,
  hoveredColor: CColors.red70,
  focusedColor: CColors.red70,
  pressedColor: CColors.red80,
);

final defaultDangerContentColor = CarbonStateColor(
  color: CColors.white0,
  hoveredColor: CColors.white0,
  focusedColor: CColors.white0,
  pressedColor: CColors.white0,
  disabledColor: CColors.gray30,
);

class CarbonButtonStyle {
  final CarbonStateColor color;
  final CarbonStateColor dangerColor;
  final CarbonStateColor contentColor;
  final CarbonStateColor dangerContentColor;
  final CarbonStateBorder innerBoarder;
  final CarbonStateBorder outerBorder;
  final CarbonStateBorder dangerOuterBorder;

  CarbonButtonStyle({
    required this.color,
    CarbonStateColor? dangerColor,
    required this.contentColor,
    CarbonStateColor? dangerContentColor,
    required this.innerBoarder,
    required this.outerBorder,
    CarbonStateBorder? dangerOuterBorder,
  })  : dangerColor = dangerColor ?? defaultDangerColor,
        dangerContentColor = dangerContentColor ?? defaultDangerContentColor,
        dangerOuterBorder = dangerOuterBorder ?? outerBorder;

  CarbonButtonStyle copyWith({
    CarbonStateColor? color,
    CarbonStateColor? dangerColor,
    CarbonStateColor? contentColor,
    CarbonStateColor? dangerContentColor,
    CarbonStateBorder? innerBoarder,
    CarbonStateBorder? outerBorder,
    CarbonStateBorder? dangerOuterBorder,
  }) {
    return CarbonButtonStyle(
      color: color ?? this.color,
      dangerColor: dangerColor ?? this.dangerColor,
      contentColor: contentColor ?? this.contentColor,
      dangerContentColor: dangerContentColor ?? this.dangerContentColor,
      innerBoarder: innerBoarder ?? this.innerBoarder,
      outerBorder: outerBorder ?? this.outerBorder,
      dangerOuterBorder: dangerOuterBorder ?? this.dangerOuterBorder,
    );
  }
}

final primaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.blue60,
    hoveredColor: CColors.blue70,
    focusedColor: CColors.blue70,
    pressedColor: CColors.blue80,
  ),
  contentColor: CarbonStateColor.all(CColors.white0, disabledColor: CColors.gray30),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.all(CColors.transparent), width: 2),
);

final primaryDark = primaryLight.copyWith(
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 2),
);

final secondaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.gray70,
    hoveredColor: CColors.gray60,
    focusedColor: CColors.gray60,
    pressedColor: CColors.gray50,
  ),
  contentColor: CarbonStateColor.all(CColors.white0, disabledColor: CColors.gray30),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.all(CColors.transparent), width: 2),
);

final secondaryDark = secondaryLight.copyWith(
  color: CarbonStateColor(
    color: CColors.gray50,
    hoveredColor: CColors.gray60,
    focusedColor: CColors.gray60,
    pressedColor: CColors.gray70,
  ),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 2),
);

final tertiaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.blue70,
    focusedColor: CColors.blue70,
    pressedColor: CColors.blue80,
  ),
  dangerColor: defaultDangerColor.copyWith(
    color: CColors.transparent,
  ),
  contentColor: CarbonStateColor(
    color: CColors.blue60,
    hoveredColor: CColors.white0,
    focusedColor: CColors.white0,
    pressedColor: CColors.white0,
    disabledColor: CColors.gray30,
  ),
  dangerContentColor: defaultDangerContentColor.copyWith(
    color: CColors.red60,
  ),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(
    color: CarbonStateColor(
      color: CColors.blue60,
      hoveredColor: CColors.blue70,
      focusedColor: CColors.blue70,
      pressedColor: CColors.blue80,
    ),
    width: 2,
  ),
  dangerOuterBorder: CarbonStateBorder(color: defaultDangerColor, width: 2),
);

final tertiaryDark = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.white0,
    focusedColor: CColors.white0,
    pressedColor: CColors.gray10,
  ),
  dangerColor: defaultDangerColor.copyWith(
    color: CColors.transparent,
  ),
  contentColor: CarbonStateColor(
    color: CColors.white0,
    hoveredColor: CColors.gray100,
    focusedColor: CColors.gray100,
    pressedColor: CColors.gray100,
    disabledColor: CColors.gray30,
  ),
  dangerContentColor: defaultDangerContentColor.copyWith(
    color: CColors.red60,
  ),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.gray100), width: 3),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.all(CColors.white0), width: 2),
  dangerOuterBorder: CarbonStateBorder(color: defaultDangerColor, width: 2),
);

final ghostLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.gray10,
    focusedColor: CColors.gray10,
    pressedColor: CColors.gray20,
  ),
  dangerColor: defaultDangerColor.copyWith(
    color: CColors.transparent,
  ),
  contentColor: CarbonStateColor.all(CColors.blue60, disabledColor: CColors.gray30),
  dangerContentColor: defaultDangerContentColor.copyWith(
    color: CColors.red60,
  ),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 2),
);

final ghostDark = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.gray80,
    focusedColor: CColors.gray80,
    pressedColor: CColors.gray70,
  ),
  contentColor: CarbonStateColor.all(CColors.blue40, disabledColor: CColors.gray30),
  innerBoarder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 4),
  outerBorder: CarbonStateBorder(color: CarbonStateColor.focus(CColors.white0), width: 2),
);

final class CButtonSize {
  final Size dimensions;
  final double padding;

  const CButtonSize._({required this.dimensions, required this.padding});

  static const regular = CButtonSize._(
    dimensions: Size(48, 48),
    padding: 16.0,
  );

  static const medium = CButtonSize._(
    dimensions: Size(40, 40),
    padding: 16.0,
  );

  static const small = CButtonSize._(
    dimensions: Size(32, 32),
    padding: 13.0,
  );
}
