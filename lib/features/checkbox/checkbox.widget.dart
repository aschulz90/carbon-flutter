import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';

import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'checkbox.props.dart';

/// Checkboxes are used when there are multiple items to select
/// in a list. Users can select zero, one, or any number of items.
class CCheckbox extends StatefulWidget {
  CCheckbox({
    Key? key,
    required ValueChanged<bool?>? onChanged,
    bool enable = true,
    bool value = false,
    String? label,
    FocusNode? focusNode,
  })  : props = CCheckboxProps(
          enable: enable,
          value: value,
          label: label,
          onChanged: onChanged,
          focusNode: focusNode,
        ),
        super(key: key);

  final CCheckboxProps props;

  @override
  State<CCheckbox> createState() => _CCheckboxState();
}

class _CCheckboxState extends State<CCheckbox> {
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
    final theme = Theme.of(context);
    final isEnabled = context.inheritedEnable ? widget.props.enable : false;

    return IgnorePointer(
      ignoring: !isEnabled,
      child: GestureDetector(
        onTap: () => widget.props.onChanged?.call(!widget.props.value),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: focusNode?.hasFocus == true ? CColors.blue60 : Colors.transparent,
              width: 2,
            ),
          ),
          padding: EdgeInsets.only(right: widget.props.label != null ? 8 : 0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  value: widget.props.value,
                  onChanged: isEnabled ? widget.props.onChanged : null,
                  focusNode: focusNode,
                ),
              ),
              if (widget.props.label != null) ...[
                CText(
                  widget.props.label!,
                  style: TextStyle(
                    color: isEnabled ? null : theme.disabledColor,
                    height: 1,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
