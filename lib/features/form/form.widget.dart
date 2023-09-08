import 'package:carbon_flutter/features/layer/layer.widget.dart';
import 'package:carbon_flutter/features/text_field/index.dart';
import 'package:carbon_flutter/features/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'form.props.dart';
import 'form.styles.dart';

enum CFormType { group, blank }

typedef _Styles = CFormStyles;

/// A form is a group of related input controls that allows
/// users to provide data or configure options.
class CForm extends StatefulWidget {
  CForm({
    Key? key,
    required List<Widget> children,
    bool enable = true,
    FormActionBuilder? actionBuilder,
    CFormType type = CFormType.blank,
  })  : props = CFormProps(
          enable: enable,
          children: children,
          type: type,
          actionBuilder: actionBuilder,
        ),
        super(key: key);

  final CFormProps props;

  @override
  CFormState createState() => CFormState();

  static CFormState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedCForm>()?.state;
  }
}

class CFormState extends State<CForm> {
  final Set<CTextFieldState> formFields = {};

  CFormType get type => widget.props.type;

  bool validate() {
    bool result = true;
    for (final field in formFields) {
      if (!field.validate()) {
        result = false;
      }
    }

    return result;
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  Widget build(BuildContext context) {
    final actionBuilder = widget.props.actionBuilder;

    Widget content = Builder(builder: (context) {
      final theme = Theme.of(context);
      return CEnable(
        value: _isEnabled,
        child: IgnorePointer(
          ignoring: !_isEnabled,
          child: _InheritedCForm(
            state: this,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: theme.colorScheme.background,
                  padding: _Styles.padding[type],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.props.children,
                  ),
                ),
                if (actionBuilder != null)
                  Builder(
                    builder: (context) => actionBuilder.call(context, this),
                  ),
              ],
            ),
          ),
        ),
      );
    });

    if (type == CFormType.group) {
      return CLayer(
        builder: (context, layerIndex, layerColor) => content,
      );
    } else {
      return content;
    }
  }
}

class _InheritedCForm extends InheritedWidget {
  const _InheritedCForm({Key? key, this.state, required Widget child}) : super(key: key, child: child);

  final CFormState? state;

  @override
  bool updateShouldNotify(oldWidget) => true;
}
