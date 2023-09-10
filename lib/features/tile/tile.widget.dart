import 'package:carbon_flutter/features/layer/layer.widget.dart';
import 'package:carbon_flutter/features/tile/tile.props.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:carbon_flutter/features/enable/index.dart';

class CTile extends StatefulWidget {
  CTile({
    Key? key,
    bool enabled = true,
    String? title,
    double titleSize = 20,
    EdgeInsets padding = const EdgeInsets.all(8),
    double? width,
    double? height,
    Duration? animationDuration,
    VoidCallback? onTap,
    FocusNode? focusNode,
    Widget? child,
  })  : props = CTileProps(
          enabled: enabled,
          title: title,
          titleSize: titleSize,
          padding: padding,
          width: width,
          height: height,
          animationDuration: animationDuration ?? Duration(milliseconds: 100),
          onTap: onTap,
          focusNode: focusNode,
          content: child,
        ),
        super(key: key);

  final CTileProps props;

  @override
  State<CTile> createState() => _CTileState();
}

class _CTileState extends State<CTile> with MaterialStateMixin {
  bool get _isEnabled => context.inheritedEnable ? widget.props.enabled : false;

  bool get _isInteractive => _isEnabled && widget.props.onTap != null;

  bool get hasFocus => _focusNode?.hasFocus == true;

  FocusNode? _focusNode;

  @override
  void initState() {
    _focusNode = widget.props.focusNode ?? FocusNode();

    _focusNode?.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  void _handleTap([Intent? _]) {
    widget.props.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IgnorePointer(
      ignoring: !_isEnabled,
      child: GestureDetector(
        onTapDown: (_) => addMaterialState(MaterialState.pressed),
        onTapUp: (_) => removeMaterialState(MaterialState.pressed),
        onTapCancel: () => removeMaterialState(MaterialState.pressed),
        onTap: _handleTap,
        child: FocusableActionDetector(
          enabled: _isInteractive,
          focusNode: _focusNode,
          onShowHoverHighlight: updateMaterialState(MaterialState.hovered),
          onShowFocusHighlight: updateMaterialState(MaterialState.focused),
          actions: {
            ActivateIntent: CallbackAction<ActivateIntent>(onInvoke: _handleTap),
          },
          child: CLayer(
            builder: (context, layerIndex, layerColor) {
              return SizedBox(
                width: widget.props.width,
                height: widget.props.height,
                child: AnimatedContainer(
                  duration: widget.props.animationDuration,
                  decoration: BoxDecoration(
                    color: layerColor.resolve(materialStates),
                  ),
                  padding: widget.props.padding,
                  foregroundDecoration: BoxDecoration(
                    border: hasFocus == true ? Border.all(
                      color: theme.focusColor,
                      width: 2,
                    ) : Border.all(
                      style: BorderStyle.none,
                    ),
                  ),
                  child: widget.props.content,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
