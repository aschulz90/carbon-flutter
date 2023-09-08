import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/outline/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'toggle.props.dart';
import 'toggle.styles.dart';

enum CToggleSize { sm, md }

enum CToggleCheckStatus { checked, unchecked }

typedef _Styles = CToggleStyles;

/// A toggle is used to quickly switch between two possible states.
///
/// They are commonly used for “on/off” switches.
class CToggle extends StatefulWidget {
  CToggle({
    Key? key,
    required void Function(bool value) onToggle,
    bool enable = true,
    bool value = true,
    bool showStatusLabel = true,
    String? labelText,
    CToggleSize size = CToggleSize.md,
    FocusNode? focusNode,
  })  : props = CToggleProps(
          onToggle: onToggle,
          enable: enable,
          value: value,
          labelText: labelText,
          size: size,
          showStatusLabel: showStatusLabel,
          focusNode: focusNode,
        ),
        super(key: key);

  final CToggleProps props;

  @override
  CToggleState createState() => CToggleState();
}

class CToggleState extends State<CToggle> with MaterialStateMixin {
  bool _outlined = false;
  bool _value = false;

  late Size _dimensions;

  @override
  void initState() {
    _value = widget.props.value;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _value = widget.props.value;
    _dimensions = _Styles.dimensions[widget.props.size]!;

    super.didChangeDependencies();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      addMaterialState(MaterialState.disabled);
    } else {
      removeMaterialState(MaterialState.disabled);
    }

    if (_value) {
      addMaterialState(MaterialState.selected);
    } else {
      removeMaterialState(MaterialState.selected);
    }
  }

  void _handleTap([Intent? _]) {
    setState(() {
      _value = !_value;
      _outlined = !_outlined;

      Future.delayed(
        const Duration(milliseconds: 750),
        () => setState(() => _outlined = !_outlined),
      );

      widget.props.onToggle(_value);
    });
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();
    final theme = Theme.of(context);
    final toggleTheme = theme.switchTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.props.labelText != null) ...[
          CText(
            widget.props.labelText!,
            style: theme.textTheme.labelMedium,
          ),
          const SizedBox(height: 16),
        ],
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: materialStates.contains(MaterialState.focused) ? CColors.blue60 : Colors.transparent,
              width: 2,
            ),
          ),
          padding: EdgeInsets.all(2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IgnorePointer(
                ignoring: !_isEnabled,
                child: FocusableActionDetector(
                  focusNode: widget.props.focusNode,
                  enabled: _isEnabled,
                  onFocusChange: updateMaterialState(MaterialState.focused),
                  onShowFocusHighlight: updateMaterialState(MaterialState.focused),
                  onShowHoverHighlight: updateMaterialState(MaterialState.hovered),
                  actions: {
                    ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _handleTap),
                  },
                  child: GestureDetector(
                    onTapUp: (_) => _handleTap(),
                    child: COutline(
                      animationDuration: 400,
                      borderRadius: BorderRadius.circular(1000),
                      outlineWidth: 2,
                      outlined: _outlined,
                      child: AnimatedContainer(
                        width: _dimensions.width,
                        height: _dimensions.height,
                        alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
                        padding: const EdgeInsets.all(3),
                        duration: _Styles.animation['duration'],
                        curve: _Styles.animation['curve'],
                        decoration: BoxDecoration(
                          color: toggleTheme.trackColor?.resolve(materialStates),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        child: AnimatedContainer(
                          height: _dimensions.height - 6,
                          width: _dimensions.height - 6,
                          alignment: Alignment.center,
                          duration: _Styles.animation['duration'],
                          curve: _Styles.animation['curve'],
                          decoration: BoxDecoration(
                            color: toggleTheme.thumbColor?.resolve(materialStates),
                            borderRadius: BorderRadius.circular(1000),
                          ),
                          child: widget.props.size == CToggleSize.sm
                              ? Icon(
                                  Icons.check,
                                  size: 6,
                                  color: toggleTheme.trackColor?.resolve(materialStates),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (widget.props.showStatusLabel) ...[
                const SizedBox(width: 8),
                CText(
                  _value ? 'On' : 'Off',
                  style: TextStyle(
                    color: _isEnabled ? null : theme.disabledColor,
                  ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
