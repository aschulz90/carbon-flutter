import 'package:flutter/material.dart';

import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'checkbox.props.dart';

/// Checkboxes are used when there are multiple items to select
/// in a list. Users can select zero, one, or any number of items.
class CCheckbox extends StatelessWidget {
  CCheckbox({
    Key? key,
    required ValueChanged<bool?>? onChanged,
    bool enable = true,
    bool value = false,
    String? label,
  })  : props = CCheckboxProps(
          enable: enable,
          value: value,
          label: label,
          onChanged: onChanged,
        ),
        super(key: key);

  final CCheckboxProps props;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEnabled = context.inheritedEnable ? props.enable : false;

    return IgnorePointer(
      ignoring: !isEnabled,
      child: GestureDetector(
        onTap: () => props.onChanged?.call(!props.value),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Transform.scale(
              scale: 1.1,
              child: Checkbox(
                value: props.value,
                onChanged: isEnabled ? props.onChanged : null,
              ),
            ),
            if (props.label != null) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: CText(
                  props.label!,
                  style: TextStyle(
                    fontSize: 14,
                    color: isEnabled ? null : theme.disabledColor,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
