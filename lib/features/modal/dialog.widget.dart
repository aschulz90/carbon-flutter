import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class CDialog extends StatelessWidget {
  const CDialog({
    super.key,
    required this.child,
    this.actions = const [],
    this.title,
    this.titleStyle = const TextStyle(
      fontSize: 24,
    ),
  }) : formActions = null;

  const CDialog.form({
    super.key,
    required this.child,
    required this.formActions,
    this.title,
    this.titleStyle = const TextStyle(
      fontSize: 24,
    ),
  }) : actions = const [];

  final String? title;
  final TextStyle titleStyle;
  final Widget child;
  final List<CButton> actions;
  final FormActionBuilder? formActions;

  List<Widget> _getContent(BuildContext context) {
    if (formActions != null) {
      return [
        Flexible(
          child: SingleChildScrollView(
            child: CForm(
              actionBuilder: formActions,
              child: child,
            ),
          ),
        ),
      ];
    }

    return [
      Flexible(
        child: SingleChildScrollView(
          child: child,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: actions,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CLayer(
      layerIndex: 1,
      builder: (context, layerIndex, layerColor) {
        return Dialog(
          backgroundColor: layerColor,
          shape: const ContinuousRectangleBorder(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: CText(
                      title ?? "",
                      style: titleStyle,
                    ),
                  ),
                  CButton.icon(
                    kind: CButtonKind.ghost,
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(
                      Icons.close,
                      color: theme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
              ..._getContent(context),
            ],
          ),
        );
      },
    );
  }
}
