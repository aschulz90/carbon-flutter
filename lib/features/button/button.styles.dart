import 'package:carbon_flutter/shared/styles/borders.style.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

import 'button.widget.dart';

class CarbonButtonStyle {
  final MaterialStateColor color;
  final MaterialStateColor contentColor;
  final MaterialStateProperty<Border> innerBoarder;
  final MaterialStateProperty<Border> outerBorder;

  const CarbonButtonStyle({
    required this.color,
    required this.contentColor,
    required this.innerBoarder,
    required this.outerBorder,
  });

  CarbonButtonStyle copyWith({
    MaterialStateColor? color,
    MaterialStateColor? contentColor,
    MaterialStateProperty<Border>? innerBoarder,
    MaterialStateProperty<Border>? outerBorder,
  }) {
    return CarbonButtonStyle(
      color: color ?? this.color,
      contentColor: contentColor ?? this.contentColor,
      innerBoarder: innerBoarder ?? this.innerBoarder,
      outerBorder: outerBorder ?? this.outerBorder,
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
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.blue60, width: 2),
);

final primaryDark = primaryLight.copyWith(
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.white0, width: 2),
);

final secondaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.gray70,
    hoveredColor: CColors.gray60,
    focusedColor: CColors.gray60,
    pressedColor: CColors.gray50,
  ),
  contentColor: CarbonStateColor.all(CColors.white0, disabledColor: CColors.gray20),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.blue60, width: 2),
);

final secondaryDark = secondaryLight.copyWith(
  color: CarbonStateColor(
    color: CColors.gray50,
    hoveredColor: CColors.gray60,
    focusedColor: CColors.gray60,
    pressedColor: CColors.gray70,
  ),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.white0, width: 2),
);

final tertiaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.blue60,
    focusedColor: CColors.blue60,
    pressedColor: CColors.blue80,
  ),
  contentColor: CarbonStateColor(
    color: CColors.blue60,
    hoveredColor: CColors.white0,
    focusedColor: CColors.white0,
    pressedColor: CColors.white0,
    disabledColor: CColors.gray30,
  ),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(color: CColors.blue60, enabledColor: CColors.blue60, width: 2),
);

final tertiaryDark = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.white0,
    focusedColor: CColors.white0,
    pressedColor: CColors.gray10,
  ),
  contentColor: CarbonStateColor(
    color: CColors.white0,
    hoveredColor: CColors.gray100,
    focusedColor: CColors.gray100,
    pressedColor: CColors.gray100,
    disabledColor: CColors.gray30,
  ),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.gray100, width: 3),
  outerBorder: CarbonStateBorder(color: CColors.white0, enabledColor: CColors.white0, width: 2),
);

final ghostLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.gray10,
    focusedColor: CColors.gray10,
    pressedColor: CColors.gray20,
  ),
  contentColor: CarbonStateColor.all(CColors.blue60),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.blue60, width: 2),
);

final ghostDark = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.gray80,
    focusedColor: CColors.gray80,
    pressedColor: CColors.gray70,
  ),
  contentColor: CarbonStateColor.all(CColors.blue40, disabledColor: CColors.gray30),
  innerBoarder: CarbonStateBorder(enabledColor: CColors.white0, width: 4),
  outerBorder: CarbonStateBorder(enabledColor: CColors.white0, width: 2),
);

abstract class CButtonStyles {

  static final Map<String, dynamic> backgroundColorAnimation = {
    'duration': Duration(milliseconds: 80),
    'curve': Curves.easeInOut,
  };

  static final Map<CButtonKind, Map<String, dynamic>> firstBorderAnimation = {
    CButtonKind.primary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.secondary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.danger: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.tertiary: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
    CButtonKind.ghost: {
      'duration': Duration(milliseconds: 0),
      'curve': Curves.easeInOut,
    },
  };

  static final Map<String, dynamic> secondBorderAnimation = {
    'duration': Duration(milliseconds: 0),
    'curve': Curves.easeInOut,
  };

  static final Map<CButtonSize, Size> dimensions = {
    CButtonSize.regular: Size(48, 48),
    CButtonSize.md: Size(40, 40),
    CButtonSize.sm: Size(32, 32),
  };

  static final Map<CButtonSize, double> padding = {
    CButtonSize.regular: 16.0,
    CButtonSize.md: 16.0,
    CButtonSize.sm: 13.0,
  };
}
