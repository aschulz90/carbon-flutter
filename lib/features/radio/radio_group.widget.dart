import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/radio/radio_group.props.dart';
import 'package:flutter/material.dart';

class CRadioGroup<T> extends StatelessWidget {
  CRadioGroup({
    super.key,
    required T? value,
    required ValueChanged<T?>? onChanged,
    bool enabled = true,
    required List<CRadioButton<T>> radioButtons,
    String? label,
    Axis direction = Axis.horizontal,
  }) : props = CRadioGroupProps(
          value: value,
          onChanged: onChanged,
          enabled: enabled,
          label: label,
          radioButtons: radioButtons,
          direction: direction,
        );

  final CRadioGroupProps<T> props;

  @override
  Widget build(BuildContext context) {
    final label = props.label;
    final isEnabled = context.inheritedEnable ? props.enabled : false;

    return CEnable(
      value: isEnabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(left: 6.0),
              child: CText(
                label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: CColors.gray60,
                ),
              ),
            ),
          Wrap(
            direction: props.direction,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              ...props.radioButtons.map(
                (e) => _RadioButton<T>(
                  data: e,
                  groupValue: props.value,
                  onChanged: props.onChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RadioButton<T> extends StatelessWidget {
  const _RadioButton({
    required this.data,
    required this.groupValue,
    required this.onChanged,
  });

  final CRadioButton<T> data;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final isEnabled = context.inheritedEnable ? data.enabled : false;

    return CEnable(
      value: isEnabled,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: GestureDetector(
          onTap: () => onChanged?.call(data.value),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<T>(
                value: data.value,
                groupValue: groupValue,
                onChanged: isEnabled ? onChanged : null,
                focusNode: data.focusNode,
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
              ),
              CText(
                data.label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
