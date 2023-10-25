import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/widgets.dart';

abstract class COverflowMenuStyles {
  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 65),
    'curve': Curves.linear,
  };

  static const Color backgroundColor = CColors.gray90;
}
