import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/widgets.dart';

abstract class CNotificationStyles {
  static const contentPadding = EdgeInsets.only(top: 14.5, bottom: 14);

  static const Map<CNotificationKind, Border> toastNotificationBorder = {
    CNotificationKind.error: Border(left: BorderSide(width: 3, color: CColors.red50)),
    CNotificationKind.info: Border(left: BorderSide(width: 3, color: CColors.blue50)),
    CNotificationKind.success: Border(left: BorderSide(width: 3, color: CColors.green40)),
    CNotificationKind.warning: Border(left: BorderSide(width: 3, color: CColors.yellow30)),
  };

  static const Map<CNotificationContrast, Map<CNotificationKind, Border>> inlineNotificationBorder = {
    CNotificationContrast.high: {
      CNotificationKind.error: Border(left: BorderSide(width: 3, color: CColors.red50)),
      CNotificationKind.info: Border(left: BorderSide(width: 3, color: CColors.blue50)),
      CNotificationKind.success: Border(left: BorderSide(width: 3, color: CColors.green40)),
      CNotificationKind.warning: Border(left: BorderSide(width: 3, color: CColors.yellow30)),
    },
    CNotificationContrast.low: {
      CNotificationKind.error: Border(
        left: BorderSide(width: 3, color: CColors.red50),
        right: BorderSide(width: 1, color: CColors.red50),
        top: BorderSide(width: 1, color: CColors.red50),
        bottom: BorderSide(width: 1, color: CColors.red50),
      ),
      CNotificationKind.info: Border(
        left: BorderSide(width: 3, color: CColors.blue50),
        right: BorderSide(width: 1, color: CColors.blue50),
        top: BorderSide(width: 1, color: CColors.blue50),
        bottom: BorderSide(width: 1, color: CColors.blue50),
      ),
      CNotificationKind.success: Border(
        left: BorderSide(width: 3, color: CColors.green40),
        right: BorderSide(width: 1, color: CColors.green40),
        top: BorderSide(width: 1, color: CColors.green40),
        bottom: BorderSide(width: 1, color: CColors.green40),
      ),
      CNotificationKind.warning: Border(
        left: BorderSide(width: 3, color: CColors.yellow30),
        right: BorderSide(width: 1, color: CColors.yellow30),
        top: BorderSide(width: 1, color: CColors.yellow30),
        bottom: BorderSide(width: 1, color: CColors.yellow30),
      ),
    },
  };
}

abstract class CNotificationAssets {
  static const Map<CNotificationContrast, IconData> closeIcon = {
    CNotificationContrast.high: CIcons.close,
    CNotificationContrast.low: CIcons.close,
  };

  static const Map<CNotificationKind, IconData> kindIcon = {
    CNotificationKind.error: CIcons.errorFilled,
    CNotificationKind.info: CIcons.informationFilled,
    CNotificationKind.success: CIcons.checkmarkFilled,
    CNotificationKind.warning: CIcons.warningFilled,
  };

  static const Map<CNotificationKind, Color> kindIconColor = {
    CNotificationKind.error: CColors.red60,
    CNotificationKind.info: CColors.blue60,
    CNotificationKind.success: CColors.green60,
    CNotificationKind.warning: CColors.yellow30,
  };
}
