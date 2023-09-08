import 'package:carbon_flutter/features/layer/layer.widget.dart';
import 'package:carbon_flutter/features/tile/tile.props.dart';
import 'package:flutter/material.dart';
import 'package:carbon_flutter/features/enable/index.dart';
import 'package:carbon_flutter/features/text/index.dart';

class CTile extends StatelessWidget {
  CTile({
    Key? key,
    bool enabled = true,
    String? title,
    String? description,
    String? label,
    double labelSize = 12,
    double titleSize = 20,
    double descriptionSize = 14,
    EdgeInsets padding = const EdgeInsets.all(16),
    VoidCallback? onTap,
    Widget? child,
  })  : props = CTileProps(
          enabled: enabled,
          label: label,
          title: title,
          description: description,
          labelSize: labelSize,
          titleSize: titleSize,
          descriptionSize: descriptionSize,
          padding: padding,
          onTap: onTap,
          content: child,
        ),
        super(key: key);

  final CTileProps props;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? props.enabled : false;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_isEnabled(context),
      child: CLayer(
        builder: (context, layerIndex, layerColor) {
          return Container(
            color: layerColor,
            padding: props.padding,
            child: InkWell(
              onTap: props.onTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (props.label != null) ...[
                    CText(
                      props.label!,
                      style: TextStyle(
                        fontSize: props.labelSize,
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (props.title != null) ...[
                    if (props.label == null) const SizedBox(height: 8),
                    CText(
                      props.title!,
                      style: TextStyle(
                        fontSize: props.titleSize,
                      ),
                    ),
                    if (props.description != null) const SizedBox(height: 11) else const SizedBox(height: 16),
                  ],
                  if (props.description != null) ...[
                    CText(
                      props.description!,
                      style: TextStyle(
                        fontSize: props.descriptionSize,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (props.content != null) props.content!,
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
