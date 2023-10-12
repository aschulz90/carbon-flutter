import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu.widget.dart';
import 'overflow_menu_item.styles.dart';

abstract class COverflowMenuStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 65),
    'curve': Curves.linear,
  };

  static const Color backgroundColor = CColors.gray90;
}
