import 'package:flutter/material.dart';

abstract class CColors {
  static const transparent = Colors.transparent;
  static const white0 = Color(0xffffffff);
  static const black100 = Color(0xff000000);
  static const blue10 = Color(0xffedf5ff);
  static const blue20 = Color(0xffd0e2ff);
  static const blue30 = Color(0xffa6c8ff);
  static const blue40 = Color(0xff78a9ff);
  static const blue50 = Color(0xff4589ff);
  static const blue60 = Color(0xff0f62fe);
  static const blue70 = Color(0xff0043ce);
  static const blue80 = Color(0xff002d9c);
  static const blue90 = Color(0xff001d6c);
  static const blue100 = Color(0xff001141);
  static const coolGray10 = Color(0xfff2f4f8);
  static const coolGray20 = Color(0xffdde1e6);
  static const coolGray30 = Color(0xffc1c7cd);
  static const coolGray40 = Color(0xffa2a9b0);
  static const coolGray50 = Color(0xff878d96);
  static const coolGray60 = Color(0xff697077);
  static const coolGray70 = Color(0xff4d5358);
  static const coolGray80 = Color(0xff343a3f);
  static const coolGray90 = Color(0xff21272a);
  static const coolGray100 = Color(0xff121619);
  static const cyan10 = Color(0xffe5f6ff);
  static const cyan20 = Color(0xffbae6ff);
  static const cyan30 = Color(0xff82cfff);
  static const cyan40 = Color(0xff33b1ff);
  static const cyan50 = Color(0xff1192e8);
  static const cyan60 = Color(0xff0072c3);
  static const cyan70 = Color(0xff00539a);
  static const cyan80 = Color(0xff003a6d);
  static const cyan90 = Color(0xff012749);
  static const cyan100 = Color(0xff061727);
  static const gray10 = Color(0xfff4f4f4);
  static const gray20 = Color(0xffe0e0e0);
  static const gray30 = Color(0xffc6c6c6);
  static const gray40 = Color(0xffa8a8a8);
  static const gray50 = Color(0xff8d8d8d);
  static const gray60 = Color(0xff6f6f6f);
  static const gray70 = Color(0xff525252);
  static const gray80 = Color(0xff393939);
  static const gray90 = Color(0xff262626);
  static const gray100 = Color(0xff161616);
  static const green10 = Color(0xffdefbe6);
  static const green20 = Color(0xffa7f0ba);
  static const green30 = Color(0xff6fdc8c);
  static const green40 = Color(0xff42be65);
  static const green50 = Color(0xff24a148);
  static const green60 = Color(0xff198038);
  static const green70 = Color(0xff0e6027);
  static const green80 = Color(0xff044317);
  static const green90 = Color(0xff022d0d);
  static const green100 = Color(0xff071908);
  static const magenta10 = Color(0xfffff0f7);
  static const magenta20 = Color(0xffffd6e8);
  static const magenta30 = Color(0xffffafd2);
  static const magenta40 = Color(0xffff7eb6);
  static const magenta50 = Color(0xffee5396);
  static const magenta60 = Color(0xffd12771);
  static const magenta70 = Color(0xff9f1853);
  static const magenta80 = Color(0xff740937);
  static const magenta90 = Color(0xff510224);
  static const magenta100 = Color(0xff2a0a18);
  static const orange40 = Color(0xffff832b);
  static const purple10 = Color(0xfff6f2ff);
  static const purple20 = Color(0xffe8daff);
  static const purple30 = Color(0xffd4bbff);
  static const purple40 = Color(0xffbe95ff);
  static const purple50 = Color(0xffa56eff);
  static const purple60 = Color(0xff8a3ffc);
  static const purple70 = Color(0xff6929c4);
  static const purple80 = Color(0xff491d8b);
  static const purple90 = Color(0xff31135e);
  static const purple100 = Color(0xff1c0f30);
  static const red10 = Color(0xfffff1f1);
  static const red20 = Color(0xffffd7d9);
  static const red30 = Color(0xffffb3b8);
  static const red40 = Color(0xffff8389);
  static const red50 = Color(0xfffa4d56);
  static const red60 = Color(0xffda1e28);
  static const red70 = Color(0xffa2191f);
  static const red80 = Color(0xff750e13);
  static const red90 = Color(0xff520408);
  static const red100 = Color(0xff2d0709);
  static const teal10 = Color(0xffd9fbfb);
  static const teal20 = Color(0xff9ef0f0);
  static const teal30 = Color(0xff3ddbd9);
  static const teal40 = Color(0xff08bdba);
  static const teal50 = Color(0xff009d9a);
  static const teal60 = Color(0xff007d79);
  static const teal70 = Color(0xff005d5d);
  static const teal80 = Color(0xff004144);
  static const teal90 = Color(0xff022b30);
  static const teal100 = Color(0xff081a1c);
  static const warmGray10 = Color(0xfff7f3f2);
  static const warmGray20 = Color(0xffe5e0df);
  static const warmGray30 = Color(0xffcac5c4);
  static const warmGray40 = Color(0xffada8a8);
  static const warmGray50 = Color(0xff8f8b8b);
  static const warmGray60 = Color(0xff736f6f);
  static const warmGray70 = Color(0xff565151);
  static const warmGray80 = Color(0xff3c3838);
  static const warmGray90 = Color(0xff272525);
  static const warmGray100 = Color(0xff171414);
  static const yellow30 = Color(0xfff1c21b);
  static const yellow20 = Color(0xfffddc69);
  static const yellow10 = Color(0xfffdf6dd);
}

class CarbonStateColor extends MaterialStateColor {
  CarbonStateColor({
    required this.color,
    required this.hoveredColor,
    required this.focusedColor,
    required this.pressedColor,
    this.selectedColor,
    this.disabledColor = CColors.gray40,
    this.animationDuration = const Duration(milliseconds: 80),
    this.animationCurve = Curves.easeInOut,
  }) : super(color.value);

  CarbonStateColor.all(
    this.color, {
    this.disabledColor = CColors.gray40,
    this.animationDuration = const Duration(milliseconds: 80),
    this.animationCurve = Curves.easeInOut,
  })  : hoveredColor = color,
        focusedColor = color,
        pressedColor = color,
        selectedColor = color,
        super(color.value);

  CarbonStateColor.focus(
    Color color, {
    this.disabledColor = CColors.gray40,
    this.animationDuration = const Duration(milliseconds: 80),
    this.animationCurve = Curves.easeInOut,
  })  : color = Colors.transparent,
        hoveredColor = Colors.transparent,
        focusedColor = color,
        pressedColor = Colors.transparent,
        selectedColor = null,
        super(Colors.transparent.value);

  CarbonStateColor.fromMaterial(
        MaterialStateColor color, {
        this.disabledColor = CColors.gray40,
        this.animationDuration = const Duration(milliseconds: 80),
        this.animationCurve = Curves.easeInOut,
      }
      ): color = color,
        hoveredColor = color.resolve({MaterialState.hovered}),
        focusedColor = color.resolve({MaterialState.focused}),
        pressedColor = color.resolve({MaterialState.pressed}),
        selectedColor = color.resolve({MaterialState.selected}),
        super(color.value);

  final Color color;
  final Color hoveredColor;
  final Color focusedColor;
  final Color pressedColor;
  final Color? selectedColor;
  final Color disabledColor;

  final Duration animationDuration;
  final Curve animationCurve;

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabledColor;
    }

    if (selectedColor != null && states.contains(MaterialState.selected)) {
      return selectedColor!;
    }

    if (states.contains(MaterialState.focused)) {
      return focusedColor;
    }

    if (states.contains(MaterialState.pressed)) {
      return pressedColor;
    }

    if (states.contains(MaterialState.hovered)) {
      return hoveredColor;
    }

    return color;
  }

  CarbonStateColor copyWith({
    Color? color,
    Color? hoveredColor,
    Color? focusedColor,
    Color? pressedColor,
    Color? selectedColor,
    Color? disabledColor,
    Duration? animationDuration,
    Curve? animationCurve,
  }) {
    return CarbonStateColor(
      color: color ?? this.color,
      hoveredColor: hoveredColor ?? this.hoveredColor,
      focusedColor: focusedColor ?? this.focusedColor,
      pressedColor: pressedColor ?? this.pressedColor,
      selectedColor: selectedColor ?? this.selectedColor,
      disabledColor: disabledColor ?? this.disabledColor,
      animationDuration: animationDuration ?? this.animationDuration,
      animationCurve: animationCurve ?? this.animationCurve,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is CarbonStateColor &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          hoveredColor == other.hoveredColor &&
          focusedColor == other.focusedColor &&
          pressedColor == other.pressedColor &&
          selectedColor == other.selectedColor &&
          disabledColor == other.disabledColor &&
          animationDuration == other.animationDuration &&
          animationCurve == other.animationCurve;

  @override
  int get hashCode =>
      super.hashCode ^
      color.hashCode ^
      hoveredColor.hashCode ^
      focusedColor.hashCode ^
      pressedColor.hashCode ^
      selectedColor.hashCode ^
      disabledColor.hashCode ^
      animationDuration.hashCode ^
      animationCurve.hashCode;
}
