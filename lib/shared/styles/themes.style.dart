import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/shared/styles/theme.gray10.dart';
import 'package:carbon_flutter/shared/styles/theme.gray100.dart';
import 'package:carbon_flutter/shared/styles/theme.gray90.dart';
import 'package:carbon_flutter/shared/styles/theme.white.dart';

import 'package:flutter/material.dart';

ThemeData getTheme(CTheme theme) => switch (theme) {
  CTheme.white => whiteTheme,
  CTheme.gray10 => gray10Theme,
  CTheme.gray90 => gray90Theme,
  CTheme.gray100 => gray100Theme,
};
