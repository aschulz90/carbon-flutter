import 'package:flutter/widgets.dart';

class CCheckboxProps {
  /// Called when the value of the checkbox change.
  ///
  /// This callback passes a new value, but doesn't update its state
  /// internally.
  ///
  /// @required
  final ValueChanged<bool?>? onChanged;

  /// Whether the checkbox is enabled or not.
  ///
  /// @default: `true`
  final bool enable;

  /// Whether the checkbox is checked or not.
  ///
  /// @default: `true`
  final bool value;

  /// A text to display beside the checkbox.
  ///
  /// @optional
  final String? label;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  CCheckboxProps({
    required this.enable,
    required this.value,
    required this.label,
    required this.onChanged,
    this.focusNode,
  });
}
