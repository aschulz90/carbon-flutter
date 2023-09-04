import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:flutter/material.dart';

extension CThemeContextExtension on BuildContext {
  get cTheme {
    return CarbonTheme.of(this).style;
  }
}
