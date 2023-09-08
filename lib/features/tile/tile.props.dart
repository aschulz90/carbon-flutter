import 'package:flutter/widgets.dart';

class CTileProps {
  final bool enabled;

  final String? title;
  final double titleSize;
  final EdgeInsets padding;
  final double? width;
  final double? height;
  final Duration animationDuration;

  final FocusNode? focusNode;

  final VoidCallback? onTap;

  final Widget? content;

  CTileProps({
    required this.enabled,
    required this.padding,
    required this.width,
    required this.height,
    required this.animationDuration,
    required this.title,
    required this.titleSize,
    required this.onTap,
    required this.focusNode,
    required this.content,
  });
}
