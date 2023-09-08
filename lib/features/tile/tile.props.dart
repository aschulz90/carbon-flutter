import 'package:flutter/widgets.dart';

class CTileProps {
  final bool enabled;

  final String? label;
  final String? title;
  final String? description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final VoidCallback? onTap;

  final Widget? content;

  CTileProps({
    required this.enabled,
    required this.label,
    required this.title,
    required this.description,
    required this.labelSize,
    required this.titleSize,
    required this.descriptionSize,
    required this.onTap,
    required this.content,
  });
}
