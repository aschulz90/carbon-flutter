import 'package:flutter/widgets.dart';

class CRadioButtonProps<T> {
  CRadioButtonProps({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    required this.focusNode,
    required this.enabled,
  });

  /// The value represented by this radio button.
  final T value;

  /// The value represented by the radio button group.
  final T? groupValue;

  /// Called when the user selects this radio button.
  final ValueChanged<T?>? onChanged;

  /// Whether the radio group is enabled or not
  ///
  /// @default: `true`
  final bool enabled;

  /// The `labelText` of this button
  final String label;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;
}