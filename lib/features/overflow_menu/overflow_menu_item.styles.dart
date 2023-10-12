import 'package:carbon_flutter/features/button/button.styles.dart';
import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/widgets.dart';

abstract class COverflowMenuItemStyles {
  static const animationDuration = Duration(milliseconds: 100);
  static const animationCurve = Curves.linear;

  static const Color dividerColor = CColors.gray80;
}

class COverFlowMenuSize {
  final Size itemSize;
  final CButtonSize buttonSize;

  const COverFlowMenuSize({
    required this.itemSize,
    required this.buttonSize,
  });

  static const regular = COverFlowMenuSize(
    itemSize: Size(160, 48),
    buttonSize: CButtonSize.regular,
  );

  static const md = COverFlowMenuSize(
    itemSize: Size(160, 40),
    buttonSize: CButtonSize.medium,
  );

  static const sm = COverFlowMenuSize(
    itemSize: Size(160, 32),
    buttonSize: CButtonSize.small,
  );
}
