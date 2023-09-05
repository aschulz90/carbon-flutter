import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/shared/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'link.props.dart';
import 'link.styles.dart';

typedef _Styles = CLinkStyles;

/// Links are used as navigational elements. They may appear on their own,
/// within a sentence or paragraph, or directly following the content.
class CLink extends StatefulWidget {
  CLink({
    Key? key,
    bool enable = true,
    required String url,
    required void Function(String url) onTap,
    double fontSize = 14,
    String? caption,
  })  : props = CLinkProps(
          caption: caption,
          url: url,
          fontSize: fontSize,
          enable: enable,
          onTap: onTap,
        ),
        super(key: key);

  final CLinkProps props;

  @override
  CLinkState createState() => CLinkState();
}

class CLinkState extends State<CLink> {
  CWidgetState _state = CWidgetState.enabled;

  void _setStateVariables() {
    if (!_isEnabled) {
      _state = CWidgetState.disabled;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    return IgnorePointer(
      ignoring: !_isEnabled,
      child: GestureDetector(
        onTap: () => widget.props.onTap(widget.props.url),
        child: CText(
          widget.props.caption ?? widget.props.url,
          style: TextStyle(
            color: _Styles.textColor[_state],
            fontSize: widget.props.fontSize,
          ),
        ),
      ),
    );
  }
}
