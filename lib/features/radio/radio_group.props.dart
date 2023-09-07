import 'package:flutter/widgets.dart';

class CRadioGroupButton<T> {
  CRadioGroupButton({
    required this.value,
    required this.label,
    this.enabled = true,
    this.focusNode,
  });

  /// The value represented by this radio button.
  final T value;

  /// Whether the radio button is enabled or not
  ///
  /// @default: `true`
  final bool enabled;

  /// The `labelText` of this button
  final String label;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;
}

class CRadioGroupProps<T> {
  const CRadioGroupProps({
    required this.value,
    required this.onChanged,
    required this.enabled,
    required this.label,
    required this.radioButtons,
    required this.direction,
  });

  /// The value represented by this radio button group.
  final T? value;

  /// Called when the user selects a radio button.
  final ValueChanged<T?>? onChanged;

  /// Whether the radio group is enabled or not
  ///
  /// @default: `true`
  final bool enabled;

  /// The `labelText` of this group
  ///
  /// @optional
  final String? label;

  /// The buttons to show in the group
  final List<CRadioGroupButton<T>> radioButtons;

  /// The direction to align the button into
  ///
  /// @default: `Axis.horizontal`
  final Axis direction;
}
