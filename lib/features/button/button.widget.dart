import 'package:carbon_flutter/carbon.dart';
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
    required VoidCallback onPressed,
    double? labelSize,
    bool isEnabled = true,
    bool isDangerous = false,
    bool expand = false,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
    FocusNode? focusNode,
    CarbonButtonStyle? style,
    TextStyle? textStyle,
    MaterialStatesController? materialStateController,
    Widget? icon,
  })  : type = CButtonType.regular,
        props = CButtonRegularProps(
          icon: icon,
          expand: expand,
          label: label,
          isEnabled: isEnabled,
          isDangerous: isDangerous,
          kind: kind,
          size: size,
          constrainMaxSize: false,
          focusNode: focusNode,
          onPressed: onPressed,
          style: style,
          textStyle: textStyle,
          materialStateController: materialStateController,
        ),
        super(key: key);

  CButton.icon({
    Key? key,
    bool isEnabled = true,
    bool isDangerous = false,
    required Widget icon,
    required VoidCallback onPressed,
    CButtonKind kind = CButtonKind.primary,
    CButtonSize size = CButtonSize.regular,
    FocusNode? focusNode,
    MaterialStatesController? materialStateController,
    CarbonButtonStyle? style,
  })  : type = CButtonType.icon,
        props = CButtonIconOnlyProps(
          isEnabled: isEnabled,
          isDangerous: isDangerous,
          icon: icon,
          onPressed: onPressed,
          kind: kind,
          focusNode: focusNode,
          size: size,
          constrainMaxSize: true,
          style: style,
          materialStateController: materialStateController,
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
      result.add(const SizedBox(width: 48));
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
  Widget _innerContent(CarbonButtonStyle buttonStyle, double borderPadding) {
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    final labelStyle = widget.props.textStyle ?? TextStyle(
      fontSize: 14,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.props.size.padding - borderPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CText(
            widget.props.label,
            style: labelStyle.copyWith(
              height: 1,
            ),
          ),
          ..._buildTrailing(contentColor),
        ],
      ),
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
  Widget _innerContent(CarbonButtonStyle buttonStyle, double borderPadding) {
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    return SizedBox(
      width: widget.props.size.dimensions.width,
      height: widget.props.size.dimensions.height,
      child: IconTheme(
        data: IconThemeData(
          color: contentColor.resolve(_materialStatesController.value),
        ),
        child: widget.props.icon,
      ),
    );
  }
}
