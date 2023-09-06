import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/index.dart';
import 'package:flutter/material.dart';

part 'button.mixin.dart';

enum CButtonKind { primary, secondary, tertiary, ghost }

enum CButtonType { regular, icon }

/// Buttons are clickable elements that are used to trigger actions.
/// They communicate calls to action to the user and allow users to interact
/// with pages in a variety of ways. Button labels express what action will
/// occur when the user interacts with it.
class CButton extends StatefulWidget {
  CButton({
    Key? key,
    required String label,
    required VoidCallback onTap,
    double labelSize = 14,
    bool isEnabled = true,
    bool isDangerous = false,
    bool expand = false,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
    FocusNode? focusNode,
    CarbonButtonStyle? style,
    Widget? icon,
  })  : type = CButtonType.regular,
        props = CButtonRegularProps(
          icon: icon,
          expand: expand,
          label: label,
          labelSize: labelSize,
          isEnabled: isEnabled,
          isDangerous: isDangerous,
          kind: kind,
          size: size,
          focusNode: focusNode,
          onTap: onTap,
          style: style,
        ),
        super(key: key);

  CButton.icon({
    Key? key,
    bool isEnabled = true,
    bool isDangerous = false,
    required Widget icon,
    required VoidCallback onTap,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
    FocusNode? focusNode,
    CarbonButtonStyle? style,
  })  : type = CButtonType.icon,
        props = CButtonIconOnlyProps(
          isEnabled: isEnabled,
          isDangerous: isDangerous,
          icon: icon,
          onTap: onTap,
          kind: kind,
          focusNode: focusNode,
          size: size,
          style: style,
        ),
        super(key: key);

  final CButtonBaseProps props;
  final CButtonType type;

  @override
  CButtonState createState() => CButtonState();
}

class CButtonState extends State<CButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.type == CButtonType.icon) {
      return _CButtonIconOnly(props: widget.props as CButtonIconOnlyProps);
    }

    return _CButtonRegular(props: widget.props as CButtonRegularProps);
  }
}

abstract class _CButtonBase extends StatefulWidget {
  CButtonBaseProps get props;
}

class _CButtonRegular extends _CButtonBase {
  _CButtonRegular({required this.props});

  @override
  final CButtonRegularProps props;

  @override
  _CButtonRegularState createState() => _CButtonRegularState();
}

class _CButtonRegularState extends _CButtonStateBase<_CButtonRegular> {

  List<Widget> _buildTrailing(CarbonStateColor contentColor) {
    final result = <Widget>[];

    /// determine the [Sizedbox] width
    if (widget.props.expand) {
      result.add(const Expanded(child: SizedBox()));
    } else if (widget.props.kind == CButtonKind.ghost) {
      if (widget.props.icon != null) {
        result.add(const SizedBox(width: 8));
      }
    } else if (widget.props.icon != null) {
      result.add(const SizedBox(width: 32));
    } else {
      result.add(const SizedBox(width: 64));
    }

    /// add button icon
    if (widget.props.icon != null) {
      result.add(IconTheme(
        data: IconThemeData(
          color: contentColor.resolve(_materialStatesController.value),
        ),
        child: widget.props.icon!,
      ));
    }

    return result;
  }

  @override
  Widget _innerContent(CarbonButtonStyle buttonStyle) {
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        CText(
          widget.props.label,
          style: TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
        ..._buildTrailing(contentColor),
      ],
    );
  }
}

//

class _CButtonIconOnly extends _CButtonBase {
  _CButtonIconOnly({required this.props});

  @override
  final CButtonIconOnlyProps props;

  @override
  _CButtonIconOnlyState createState() => _CButtonIconOnlyState();
}

class _CButtonIconOnlyState extends _CButtonStateBase<_CButtonIconOnly> {

  @override
  Widget _innerContent(CarbonButtonStyle buttonStyle) {
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    return IconTheme(
      data: IconThemeData(
        color: contentColor.resolve(_materialStatesController.value),
      ),
      child: widget.props.icon,
    );
  }
}
