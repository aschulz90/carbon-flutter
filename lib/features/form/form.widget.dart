import 'package:carbon_flutter/features/text_field/index.dart';
import 'package:carbon_flutter/features/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/features/enable/index.dart';
import 'package:carbon_flutter/features/inherited_styles/index.dart';
import 'package:carbon_flutter/shared/index.dart';

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
    Widget? action,
    CFormType type = CFormType.blank,
  })  : props = CFormProps(
          enable: enable,
          children: children,
          type: type,
          action: action,
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

  CWidgetState _state = CWidgetState.enabled;
  CFormType _type = CFormType.blank;

  CFormType get type => widget.props.type;

  bool validate() {
    for (final field in formFields) {
      if (!field.validate()) {
        return false;
      }
    }

    return true;
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    _type = type;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

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
                  padding: _Styles.padding[_type],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.props.children,
                  ),
                ),
                if (widget.props.action != null) widget.props.action!,
              ],
            ),
          ),
        ),
      );
    });

    if (_type == CFormType.group) {
      return CarbonThemeLayer(
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
