import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'overflow_menu.widget.dart';

abstract class COverflowMenuButtonStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 100),
    'curve': Curves.linear,
  };

  static const Map<CWidgetState, Color> backgroundColor = {
    CWidgetState.enabled: CColors.gray100,
    CWidgetState.focused: CColors.gray90,
    CWidgetState.disabled: CColors.gray100,
  };
}
