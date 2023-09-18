import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu.widget.dart';

abstract class COverflowMenuItemStyles {
  static const animationDuration = Duration(milliseconds: 100);
  static const animationCurve = Curves.linear;

  static const Map<COverflowMenuSize, Size> dimensions = {
    COverflowMenuSize.regular: Size(160, 48),
    COverflowMenuSize.md: Size(160, 40),
    COverflowMenuSize.sm: Size(160, 32),
  };

  static const Color dividerColor = CColors.gray80;
}
