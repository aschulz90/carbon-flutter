import 'package:carbon_flutter/features/enable/index.dart';
import 'package:carbon_flutter/features/radio/radio.props.dart';
import 'package:carbon_flutter/features/text/text.widget.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

class CRadioButton<T> extends StatefulWidget {
  CRadioButton({
    super.key,
    required T value,
    bool enabled = true,
    required String label,
    T? groupValue,
    ValueChanged<T?>? onChanged,
    FocusNode? focusNode,
  }) : props = CRadioButtonProps<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          label: label,
          focusNode: focusNode,
          enabled: enabled,
        );

  final CRadioButtonProps<T> props;

  @override
  State<CRadioButton<T>> createState() => _CRadioButtonState<T>();
}

class _CRadioButtonState<T> extends State<CRadioButton<T>> {

  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = widget.props.focusNode ?? FocusNode();

    focusNode?.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.inheritedEnable ? widget.props.enabled : false;

    return CEnable(
      value: isEnabled,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: GestureDetector(
          onTap: () => widget.props.onChanged?.call(widget.props.value),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: focusNode?.hasFocus == true ? CColors.blue60 : Colors.transparent,
                width: 2,
              ),
            ),
            padding: EdgeInsets.only(right: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio<T>(
                  value: widget.props.value,
                  groupValue: widget.props.groupValue,
                  onChanged: isEnabled ? widget.props.onChanged : null,
                  focusNode: focusNode,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                ),
                CText(
                  widget.props.label,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
