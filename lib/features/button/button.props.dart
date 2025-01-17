import 'package:carbon_flutter/features/button/button.styles.dart';
import 'package:flutter/material.dart';

import 'button.widget.dart';

class CButtonBaseProps {
  /// Called when the button is tapped.
  ///
  /// @required
  final VoidCallback? onPressed;

  /// Whether the button is enabled or not.
  ///
  /// @default: `true`
  final bool isEnabled;

  /// Whether the button is dangerous or not. Not applicable to secondary buttons.
  ///
  /// @default: `false`
  final bool isDangerous;

  /// The kind that the button represents. It can be `primary,
  /// secondary, tertiary, ghost`.
  ///
  /// @default: `CButtonKind.primary`
  final CButtonKind kind;

  /// The size of this button. It can be `regular, sm, md`.
  ///
  /// @default: `CButtonSize.regular`
  final CButtonSize size;

  final bool constrainMaxSize;

  final CarbonButtonStyle? style;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  final MaterialStatesController? materialStateController;

  CButtonBaseProps({
    required this.isEnabled,
    this.isDangerous = false,
    required this.kind,
    required this.size,
    required this.constrainMaxSize,
    required this.onPressed,
    this.focusNode,
    this.style,
    this.materialStateController,
  });
}

class CButtonRegularProps extends CButtonBaseProps {
  /// A text to display in the button.
  ///
  /// @required
  final String label;

  final TextStyle? textStyle;

  /// An optional icon to display in the button.
  ///
  /// @optional
  final Widget? icon;

  /// Whether the button should fill the available width.
  ///
  /// @default: `false`
  final bool expand;

  CButtonRegularProps({
    required this.icon,
    required this.expand,
    required this.label,
    required super.isEnabled,
    super.isDangerous,
    required super.kind,
    required super.size,
    required super.constrainMaxSize,
    super.focusNode,
    super.style,
    this.textStyle,
    required super.onPressed,
    super.materialStateController,
  });
}

class CButtonIconOnlyProps extends CButtonBaseProps {
  /// An icon to display in the button.
  ///
  /// @required
  final Widget icon;

  CButtonIconOnlyProps({
    required this.icon,
    required super.isEnabled,
    super.isDangerous,
    required super.kind,
    required super.size,
    required super.constrainMaxSize,
    super.focusNode,
    super.style,
    required super.onPressed,
    super.materialStateController,
  });
}
