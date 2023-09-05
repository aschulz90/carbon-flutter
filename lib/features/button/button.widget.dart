import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/index.dart';
import 'package:flutter/material.dart';

import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'button.props.dart';
import 'button.styles.dart';

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
          color: contentColor.resolve(materialStates),
        ),
        child: widget.props.icon!,
      ));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();
    final buttonStyle = widget.props.style ?? _getStyle(context);
    final backgroundColor = isDangerous ? buttonStyle.dangerColor : buttonStyle.color;
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    final outerBorder = isDangerous ? buttonStyle.dangerOuterBorder : buttonStyle.outerBorder;

    return CEnable(
      value: isEnabled,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: Focus(
          focusNode: widget.props.focusNode,
          canRequestFocus: isEnabled,
          onFocusChange: updateMaterialState(MaterialState.focused),
          child: MouseRegion(
            onEnter: (event) => addMaterialState(MaterialState.hovered),
            onExit: (event) => removeMaterialState(MaterialState.hovered),
            child: GestureDetector(
              onTap: widget.props.onTap,
              onTapDown: (_) => addMaterialState(MaterialState.pressed),
              onTapUp: (_) => removeMaterialState(MaterialState.pressed),
              onTapCancel: () => removeMaterialState(MaterialState.pressed),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedContainer(
                      height: dimensions.height,
                      duration: backgroundColor.animationDuration,
                      curve: backgroundColor.animationCurve,
                      decoration: BoxDecoration(
                        color: backgroundColor.resolve(materialStates),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      height: dimensions.height,
                      duration: buttonStyle.innerBoarder.animationDuration,
                      curve: buttonStyle.innerBoarder.animationCurve,
                      decoration: BoxDecoration(
                        border: buttonStyle.innerBoarder.resolve(materialStates),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      height: dimensions.height,
                      duration: outerBorder.animationDuration,
                      curve: outerBorder.animationCurve,
                      decoration: BoxDecoration(
                        border: outerBorder.resolve(materialStates),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: dimensions.height,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: widget.props.size.padding,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CText(
                            widget.props.label,
                            style: TextStyle(
                              fontSize: widget.props.labelSize,
                              color: contentColor.resolve(materialStates),
                            ),
                          ),
                          ..._buildTrailing(contentColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
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
  Widget build(BuildContext context) {
    _setStateVariables();
    final buttonStyle = widget.props.style ?? _getStyle(context);
    final backgroundColor = isDangerous ? buttonStyle.dangerColor : buttonStyle.color;
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;

    return CEnable(
      value: isEnabled,
      child: IgnorePointer(
        ignoring: !isEnabled,
        child: Focus(
          focusNode: widget.props.focusNode,
          canRequestFocus: isEnabled,
          onFocusChange: updateMaterialState(MaterialState.focused),
          child: MouseRegion(
            onEnter: (event) => addMaterialState(MaterialState.hovered),
            onExit: (event) => removeMaterialState(MaterialState.hovered),
            child: GestureDetector(
              onTap: widget.props.onTap,
              onTapDown: (_) => addMaterialState(MaterialState.pressed),
              onTapUp: (_) => removeMaterialState(MaterialState.pressed),
              onTapCancel: () => removeMaterialState(MaterialState.pressed),
              child: Stack(
                children: [
                  AnimatedContainer(
                    width: dimensions.width,
                    height: dimensions.height,
                    duration: backgroundColor.animationDuration,
                    curve: backgroundColor.animationCurve,
                    decoration: BoxDecoration(
                      color: backgroundColor.resolve(materialStates),
                    ),
                  ),
                  AnimatedContainer(
                    width: dimensions.width,
                    height: dimensions.height,
                    duration: buttonStyle.innerBoarder.animationDuration,
                    curve: buttonStyle.innerBoarder.animationCurve,
                    decoration: BoxDecoration(
                      border: buttonStyle.innerBoarder.resolve(materialStates),
                    ),
                  ),
                  AnimatedContainer(
                    width: dimensions.width,
                    height: dimensions.height,
                    duration: buttonStyle.outerBorder.animationDuration,
                    curve: buttonStyle.outerBorder.animationCurve,
                    decoration: BoxDecoration(
                      border: buttonStyle.outerBorder.resolve(materialStates),
                    ),
                  ),
                  SizedBox(
                    width: dimensions.width,
                    height: dimensions.height,
                    child: Align(
                      alignment: Alignment.center,
                      child: IconTheme(
                        data: IconThemeData(
                          color: contentColor.resolve(materialStates),
                        ),
                        child: widget.props.icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
