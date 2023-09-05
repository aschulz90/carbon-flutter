import 'package:flutter/material.dart';
import 'package:carbon_flutter/shared/index.dart';

CheckboxThemeData checkboxTheme({
  required Color selected,
  required Color cursor,
  Color disabled = CColors.gray40,
}) {
  return CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2.0),
    ),
    side: MaterialStateBorderSide.resolveWith((states) {
      if(states.contains(MaterialState.disabled)) {
        return BorderSide(
          color: disabled,
          width: 1,
        );
      }

      if (states.contains(MaterialState.focused)) {
        return BorderSide(
          color: selected,
          width: 2,
        );
      }

      return BorderSide(
        color: selected,
        width: 1,
      );
    }),
    fillColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.disabled) && states.contains(MaterialState.selected)) {
        return disabled;
      }

      if (states.contains(MaterialState.selected)) {
        return selected;
      }

      return CColors.transparent;
    }),
    checkColor: MaterialStateColor.resolveWith((states) => cursor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    splashRadius: 0,
  );
}
