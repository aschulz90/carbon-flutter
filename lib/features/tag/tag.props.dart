import 'package:carbon_flutter/features/tag/tag.style.dart';
import 'package:flutter/foundation.dart';

/// {@template tag_props}
/// [CTagProps] are used with [CTag] to customize the style and behavior of the
/// component.
/// {@endtemplate}
@immutable
class CTagProps {
  /// Whether the tag is enabled or not.
  ///
  /// @default: `true`
  final bool enabled;

  /// the callback when the filter icon is pressed
  final VoidCallback? onFilterPressed;

  /// A text to display inside the tag.
  ///
  /// @mandatory
  final String label;

  /// {@macro tag_size}
  final CTagSize size;

  /// {@macro tag_style}
  final CTagStyle style;

  /// Creates a [CTagProps].
  const CTagProps({
    required this.enabled,
    required this.label,
    this.onFilterPressed,
    required this.style,
    required this.size,
  });
}
