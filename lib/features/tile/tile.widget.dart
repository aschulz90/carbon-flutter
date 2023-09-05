import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:carbon_flutter/features/tile/tile.props.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/features/enable/index.dart';
import 'package:carbon_flutter/features/text/index.dart';

class CTile extends StatelessWidget {
  CTile({
    Key? key,
    bool enable = true,
    String? title,
    String? description,
    String? label,
    double labelSize = 12,
    double titleSize = 20,
    double descriptionSize = 14,
    Widget? child,
  })  : props = CTileProps(
          enable: enable,
          label: label,
          title: title,
          description: description,
          labelSize: labelSize,
          titleSize: titleSize,
          descriptionSize: descriptionSize,
          content: child,
        ),
        super(key: key);

  final CTileProps props;

  bool _isEnabled(BuildContext context) {
    return context.inheritedEnable ? props.enable : false;
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !_isEnabled(context),
      child: CarbonThemeLayer(
        builder: (context, layerIndex, layerColor) {
          return Container(
            color: layerColor,
            padding: EdgeInsets.all(16),
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
                if (props.label != null) ...[
                  if (props.label == null) const SizedBox(height: 8),
                  CText(
                    props.label!,
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
          );
        },
      ),
    );
  }
}
