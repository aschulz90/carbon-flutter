import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

class CTagSize {
  const CTagSize({
    required this.height,
    required this.borderRadius,
  });

  final double height;
  final BorderRadiusGeometry borderRadius;

  static const md = CTagSize(
    height: 24,
    borderRadius: BorderRadius.all(Radius.circular(12)),
  );

  static const sm = CTagSize(
    height: 18,
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
}

abstract class CTagStyle {
  const CTagStyle();

  MaterialStateProperty<Color> background(BuildContext context);

  MaterialStateProperty<Color> content(BuildContext context);

  BorderSide border(BuildContext context) => BorderSide.none;

  static final all = <String, CTagStyle>{
    'red': CTagStyle.red,
    'magenta': CTagStyle.magenta,
    'purple': CTagStyle.purple,
    'blue': CTagStyle.blue,
    'cyan': CTagStyle.cyan,
    'teal': CTagStyle.teal,
    'green': CTagStyle.green,
    'gray': CTagStyle.gray,
    'coolGray': CTagStyle.coolGray,
    'warmGray': CTagStyle.warmGray,
    'highContrast': CTagStyle.highContrast,
    'ghost': CTagStyle.ghost,
    'disabled': CTagStyle.disabled,
  };

  static final CTagStyle red = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.red40,
      hoveredColor: CColors.red60,
      focusedColor: CColors.red60,
      pressedColor: CColors.red60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.red80),
  );

  static final CTagStyle magenta = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.magenta40,
      hoveredColor: CColors.magenta60,
      focusedColor: CColors.magenta60,
      pressedColor: CColors.magenta60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.magenta80),
  );

  static final CTagStyle purple = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.purple40,
      hoveredColor: CColors.purple60,
      focusedColor: CColors.purple60,
      pressedColor: CColors.purple60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.purple80),
  );

  static final CTagStyle blue = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.blue40,
      hoveredColor: CColors.blue60,
      focusedColor: CColors.blue60,
      pressedColor: CColors.blue60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.blue80),
  );

  static final CTagStyle cyan = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.cyan40,
      hoveredColor: CColors.cyan60,
      focusedColor: CColors.cyan60,
      pressedColor: CColors.cyan60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.cyan80),
  );

  static final CTagStyle teal = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.teal40,
      hoveredColor: CColors.teal60,
      focusedColor: CColors.teal60,
      pressedColor: CColors.teal60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.teal80),
  );

  static final CTagStyle green = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.green40,
      hoveredColor: CColors.green60,
      focusedColor: CColors.green60,
      pressedColor: CColors.green60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.green80),
  );

  static final CTagStyle gray = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.gray40,
      hoveredColor: CColors.gray60,
      focusedColor: CColors.gray60,
      pressedColor: CColors.gray60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.gray80),
  );

  static final CTagStyle coolGray = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.coolGray40,
      hoveredColor: CColors.coolGray60,
      focusedColor: CColors.coolGray60,
      pressedColor: CColors.coolGray60,
    ),
    contentColor: MaterialStatePropertyAll(CColors.coolGray80),
  );

  static final CTagStyle warmGray = CTagStateStyle(
    backgroundColor: CarbonStateColor(
      color: CColors.warmGray40,
      hoveredColor: CColors.warmGray50,
      focusedColor: CColors.warmGray50,
      pressedColor: CColors.warmGray50,
    ),
    contentColor: MaterialStatePropertyAll(CColors.warmGray80),
  );

  static const CTagStyle highContrast = _CTagStyleHighContrast();

  static const CTagStyle ghost = _CTagStyleGhost();

  static const CTagStyle disabled = _CTagStyleDisabled();
}

class CTagStateStyle extends CTagStyle {
  final MaterialStateProperty<Color> backgroundColor;
  final MaterialStateProperty<Color> contentColor;

  const CTagStateStyle({
    required this.backgroundColor,
    required this.contentColor,
  });

  @override
  MaterialStateProperty<Color> background(BuildContext context) {
    return backgroundColor;
  }

  @override
  MaterialStateProperty<Color> content(BuildContext context) {
    return contentColor;
  }
}

class _CTagStyleHighContrast extends CTagStyle {
  const _CTagStyleHighContrast();

  @override
  MaterialStateProperty<Color> background(BuildContext context) {
    final theme = Theme.of(context);
    return CarbonStateColor(
      color: theme.colorScheme.onBackground,
      pressedColor: CColors.gray50,
      focusedColor: CColors.gray50,
      hoveredColor: CColors.gray50,
    );
  }

  @override
  MaterialStateProperty<Color> content(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialStatePropertyAll(theme.colorScheme.background);
  }
}

class _CTagStyleDisabled extends CTagStyle {
  const _CTagStyleDisabled();

  @override
  MaterialStateProperty<Color> background(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialStatePropertyAll(theme.disabledColor);
  }

  @override
  MaterialStateProperty<Color> content(BuildContext context) {
    return MaterialStatePropertyAll(CColors.gray50);
  }
}

class _CTagStyleGhost extends CTagStyle {
  const _CTagStyleGhost();

  @override
  MaterialStateProperty<Color> background(BuildContext context) {
    return CarbonStateColor(
      color: Colors.transparent,
      pressedColor: CColors.gray50.withOpacity(0.3),
      focusedColor: CColors.gray50.withOpacity(0.3),
      hoveredColor: CColors.gray50.withOpacity(0.3),
    );
  }

  @override
  MaterialStateProperty<Color> content(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialStatePropertyAll(theme.colorScheme.onBackground);
  }

  @override
  BorderSide border(BuildContext context) {
    final theme = Theme.of(context);
    return BorderSide(
      color: theme.colorScheme.onBackground,
      width: 1,
    );
  }
}
