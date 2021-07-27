import 'package:flutter/material.dart';
import 'package:carbon/features/enable/index.dart';
import 'package:carbon/features/text/index.dart';
import 'package:carbon/shared/index.dart';

import 'form.enum.dart';
import 'form.style.dart';

class CForm extends StatefulWidget {
  CForm({
    Key? key,
    this.enable = true,
    this.title,
    this.description,
    this.label,
    this.labelSize = 12,
    this.titleSize = 20,
    this.descriptionSize = 14,
    this.type = CFormType.modal,
    this.content,
    this.actions,
  }) : super(key: key);

  final bool enable;
  final CFormType type;
  final String? label;
  final String? title;
  final String? description;
  final double labelSize;
  final double titleSize;
  final double descriptionSize;

  final Widget? content;
  final Widget? actions;

  @override
  CFormState createState() => CFormState();

  static CFormState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InteritedCForm>()?.state;
  }
}

class CFormState extends State<CForm> {
  final layouts = CFormStyle.layouts;
  final colors = CFormStyle.colors;

  /// styles helpers
  late String type, state, selector;

  var _state = CWidgetState.enabled;

  bool _isEnabled() {
    return context.inheritedEnable ? widget.enable : false;
  }

  void _evaluateStateVariables() {
    /// determine the [_state] of the widget.

    if (!_isEnabled()) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }

    type = enumToString(widget.type);
    state = enumToString(_state);

    selector = 'form-$type-$state';
  }

  @override
  Widget build(BuildContext context) {
    _evaluateStateVariables();

    return CEnable(
      value: _isEnabled(),
      child: IgnorePointer(
        ignoring: !_isEnabled(),
        child: _InteritedCForm(
          state: this,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: colors['$selector-background-color'],
                padding: layouts['form-$type-padding'],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.label != null) ...[
                      CText(
                        data: widget.label,
                        style: TextStyle(
                          fontSize: widget.labelSize,
                          color: colors['$selector-label-color'],
                        ),
                      ),
                      const SizedBox(height: 4),
                    ],
                    if (widget.title != null) ...[
                      if (widget.label == null) const SizedBox(height: 8),
                      CText(
                        data: widget.title,
                        style: TextStyle(
                          fontSize: widget.titleSize,
                          color: colors['$selector-title-color'],
                        ),
                      ),
                      SizedBox(height: widget.description != null ? 11 : 16),
                    ],
                    if (widget.description != null) ...[
                      CText(
                        data: widget.description,
                        style: TextStyle(
                          fontSize: widget.descriptionSize,
                          color: colors['$selector-description-color'],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                    if (widget.content != null) widget.content!,
                  ],
                ),
              ),
              if (widget.actions != null) widget.actions!,
            ],
          ),
        ),
      ),
    );
  }
}

class _InteritedCForm extends InheritedWidget {
  const _InteritedCForm({Key? key, this.state, required Widget child}) : super(key: key, child: child);

  final CFormState? state;

  @override
  bool updateShouldNotify(oldWidget) => true;
}
