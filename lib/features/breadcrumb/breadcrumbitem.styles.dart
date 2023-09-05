import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

abstract class CBreadcrumbItemStyles {
  static const double itemSpacing = 4.0;

  static const double borderRadius = 4.0;

  static const Map<String, dynamic> animation = {
    'duration': Duration(milliseconds: 100),
    'curve': Curves.linear,
  };
}
