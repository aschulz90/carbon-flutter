import 'package:flutter/widgets.dart';

import 'form.widget.dart';

typedef FormActionBuilder = Widget Function(BuildContext context, CFormState form);

class CFormProps {
  /// The content of the form.
  ///
  /// @required
  final List<Widget> children;

  final EdgeInsets padding;

  /// Whether the form is enabled or not.
  ///
  /// @default: `true`
  final bool enable;

  /// The type of the form. It can be `group, blank`.
  ///
  /// @default: `CFormType.blank`
  final CFormType type;

  /// An action widget to display at the end of the form.
  ///
  /// @optional
  final FormActionBuilder? actionBuilder;

  CFormProps({
    required this.enable,
    required this.children,
    required this.padding,
    required this.type,
    required this.actionBuilder,
  });
}
