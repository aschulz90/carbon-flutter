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

final defaultLightInnerBorder = CarbonStateBorder(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.transparent,
    pressedColor: CColors.transparent,
    focusedColor: CColors.white0,
  ),
  width: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return 2;
    }

    return 0;
  }),
);

final defaultDarkInnerBorder = CarbonStateBorder(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.transparent,
    pressedColor: CColors.transparent,
    focusedColor: CColors.gray90,
  ),
  width: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.focused)) {
      return 1;
    }

    return 0;
  }),
);

final defaultLightOuterBorder = CarbonStateBorder(
  color: CarbonStateColor.all(Colors.transparent),
  width: MaterialStateProperty.all(0),
);

final defaultDarkOuterBorder = CarbonStateBorder(
  color: CarbonStateColor.focus(CColors.white0),
  width: MaterialStateProperty.all(2),
);

class CarbonButtonStyle {
  final CarbonStateColor color;
  final CarbonStateColor dangerColor;
  final CarbonStateColor contentColor;
  final CarbonStateColor dangerContentColor;
  final CarbonStateBorder outerBorder;
  final CarbonStateBorder dangerOuterBorder;
  final CarbonStateBorder innerBorder;
  final CarbonStateBorder dangerInnerBorder;

  CarbonButtonStyle({
    required this.color,
    CarbonStateColor? dangerColor,
    required this.contentColor,
    CarbonStateColor? dangerContentColor,
    required this.outerBorder,
    CarbonStateBorder? dangerOuterBorder,
    required this.innerBorder,
    CarbonStateBorder? dangerInnerBorder,
  })  : dangerColor = dangerColor ?? defaultDangerColor,
        dangerContentColor = dangerContentColor ?? defaultDangerContentColor,
        dangerOuterBorder = dangerOuterBorder ?? outerBorder,
        dangerInnerBorder = dangerInnerBorder ?? innerBorder;

  CarbonButtonStyle copyWith({
    CarbonStateColor? color,
    CarbonStateColor? dangerColor,
    CarbonStateColor? contentColor,
    CarbonStateColor? dangerContentColor,
    CarbonStateBorder? outerBorder,
    CarbonStateBorder? dangerOuterBorder,
    CarbonStateBorder? innerBorder,
    CarbonStateBorder? dangerInnerBorder,
  }) {
    return CarbonButtonStyle(
      color: color ?? this.color,
      dangerColor: dangerColor ?? this.dangerColor,
      contentColor: contentColor ?? this.contentColor,
      dangerContentColor: dangerContentColor ?? this.dangerContentColor,
      outerBorder: outerBorder ?? this.outerBorder,
      dangerOuterBorder: dangerOuterBorder ?? this.dangerOuterBorder,
      innerBorder: innerBorder ?? this.innerBorder,
      dangerInnerBorder: dangerInnerBorder ?? this.dangerInnerBorder,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarbonButtonStyle &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          dangerColor == other.dangerColor &&
          contentColor == other.contentColor &&
          dangerContentColor == other.dangerContentColor &&
          outerBorder == other.outerBorder &&
          dangerOuterBorder == other.dangerOuterBorder &&
          innerBorder == other.innerBorder &&
          dangerInnerBorder == other.dangerInnerBorder;

  @override
  int get hashCode =>
      color.hashCode ^
      dangerColor.hashCode ^
      contentColor.hashCode ^
      dangerContentColor.hashCode ^
      outerBorder.hashCode ^
      dangerOuterBorder.hashCode ^
      innerBorder.hashCode ^
      dangerInnerBorder.hashCode;
}

final primaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.blue60,
    hoveredColor: CColors.blue70,
    focusedColor: CColors.blue70,
    pressedColor: CColors.blue80,
  ),
  contentColor: CarbonStateColor.all(CColors.white0, disabledColor: CColors.gray30),
  innerBorder: defaultLightInnerBorder,
  outerBorder: defaultLightOuterBorder,
);

final primaryDark = primaryLight.copyWith(
  innerBorder: defaultDarkInnerBorder,
  dangerInnerBorder: defaultDarkInnerBorder,
  outerBorder: defaultDarkOuterBorder,
  dangerOuterBorder: defaultDarkOuterBorder,
);

final secondaryLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.gray80,
    hoveredColor: CColors.gray70,
    focusedColor: CColors.gray80,
    pressedColor: CColors.gray60,
  ),
  contentColor: CarbonStateColor.all(CColors.white0, disabledColor: CColors.gray30),
  innerBorder: defaultLightInnerBorder,
  outerBorder: defaultLightOuterBorder,
);

final secondaryDark = secondaryLight.copyWith(
  color: CarbonStateColor(
    color: CColors.gray60,
    hoveredColor: CColors.gray70,
    focusedColor: CColors.gray60,
    pressedColor: CColors.gray80,
  ),
  innerBorder: defaultDarkInnerBorder,
  outerBorder: defaultDarkOuterBorder,
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
  innerBorder: defaultLightInnerBorder,
  outerBorder: CarbonStateBorder(
    color: CarbonStateColor(
      color: CColors.blue60,
      hoveredColor: CColors.blue70,
      focusedColor: CColors.blue70,
      pressedColor: CColors.blue80,
    ),
    width: MaterialStatePropertyAll(2),
  ),
  dangerOuterBorder: CarbonStateBorder(
    color: defaultDangerColor,
    width: MaterialStatePropertyAll(2),
  ),
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
    innerBorder: defaultDarkInnerBorder,
    outerBorder: CarbonStateBorder(
      color: CarbonStateColor.all(CColors.white0),
      width: MaterialStateProperty.all(2),
    ),
    dangerOuterBorder: CarbonStateBorder(
      color: defaultDangerColor.copyWith(focusedColor: CColors.white0),
      width: MaterialStateProperty.all(2),
    ));

final ghostLight = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.white0,
    hoveredColor: CColors.gray10,
    focusedColor: CColors.transparent,
    pressedColor: CColors.gray20,
    disabledColor: CColors.transparent,
  ),
  dangerColor: defaultDangerColor.copyWith(
    color: CColors.transparent,
    focusedColor: CColors.transparent,
  ),
  contentColor: CarbonStateColor.all(CColors.blue60, disabledColor: CColors.gray30),
  dangerContentColor: defaultDangerContentColor.copyWith(
    color: CColors.red60,
    focusedColor: CColors.red60,
  ),
  innerBorder: CarbonStateBorder(
    color: CarbonStateColor.all(Colors.transparent),
    width: MaterialStatePropertyAll(0),
  ),
  outerBorder: CarbonStateBorder(
    color: CarbonStateColor.focus(
      CColors.blue60,
      disabledColor: CColors.transparent,
    ),
    width: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.focused)) {
        return 2.0;
      }
      return 0.0;
    }),
  ),
);

final ghostDark = CarbonButtonStyle(
  color: CarbonStateColor(
    color: CColors.transparent,
    hoveredColor: CColors.gray80,
    focusedColor: CColors.transparent,
    pressedColor: CColors.gray70,
    disabledColor: CColors.transparent,
  ),
  dangerColor: defaultDangerColor.copyWith(
    color: CColors.transparent,
    focusedColor: CColors.transparent,
  ),
  contentColor: CarbonStateColor.all(CColors.blue40, disabledColor: CColors.gray30),
  dangerContentColor: defaultDangerContentColor.copyWith(
    color: CColors.red60,
    focusedColor: CColors.red60,
  ),
  innerBorder: CarbonStateBorder(
    color: CarbonStateColor.all(CColors.transparent),
    width: MaterialStateProperty.all(0),
  ),
  outerBorder: CarbonStateBorder(
    color: CarbonStateColor.focus(
      CColors.white0,
      disabledColor: CColors.transparent,
    ),
    width: MaterialStateProperty.all(2.0),
  ),
);

final class CButtonSize {
  final Size dimensions;
  final double padding;

  const CButtonSize({required this.dimensions, required this.padding});

  static const regular = CButtonSize(
    dimensions: Size(48, 48),
    padding: 16.0,
  );

  static const medium = CButtonSize(
    dimensions: Size(40, 40),
    padding: 16.0,
  );

  static const small = CButtonSize(
    dimensions: Size(32, 32),
    padding: 13.0,
  );
}
