import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/overflow_menu/overflow_menu_item.styles.dart';
import 'package:flutter/material.dart';

/// A ghost button to display/hide an overflow menu when pressed.
class COverflowMenuButton extends StatefulWidget {
  COverflowMenuButton({
    Key? key,
    required Widget icon,
    required List<COverflowMenuItem> items,
    String? iconDescription,
    bool enable = true,
    bool barrierDismissible = true,
    VoidCallback? onClose,
    VoidCallback? onOpen,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.regular,
  })  : assert(items.isNotEmpty),
        props = COverflowMenuButtonProps(
          icon: icon,
          enable: enable,
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        ),
        super(key: key);

  final COverflowMenuButtonProps props;

  @override
  COverflowMenuButtonState createState() => COverflowMenuButtonState();
}

class COverflowMenuButtonState extends State<COverflowMenuButton> {
  final _controller = COverflowMenuController();
  final MaterialStatesController _materialStatesController = MaterialStatesController();

  bool get _isOpen => _controller.isOpen;

  void _openMenu() {
    _controller.open();
  }

  void _closeMenu() {
    _controller.close();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        _materialStatesController.update(MaterialState.selected, _isOpen);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      if (_isOpen) {
        _closeMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();

    final buttonStyle = CarbonTheme.of(context).buttonTheme.ghost;
    final nextLayerColor = CLayer.layerColor(context, offset: 1);
    final nextOnLayerColor = CLayer.onLayerColor(context, offset: 1);
    final iconColor = IconTheme.of(context).color ?? Theme.of(context).colorScheme.onBackground;

    return COverflowMenu(
      controller: _controller,
      barrierDismissible: widget.props.barrierDismissible,
      size: widget.props.size,
      onOpen: widget.props.onOpen,
      onClose: () {
        _materialStatesController.update(MaterialState.selected, false);
        widget.props.onClose;
      },
      menuOffset: widget.props.menuOffset,
      items: widget.props.items.map((item) {
        return COverflowMenuItem(
          key: item.key,
          enable: item.props.enable,
          hasDivider: item.props.hasDivider,
          entry: item.props.entry,
        );
      }).toList(),
      child: CButton.icon(
        icon: widget.props.icon,
        onPressed: () => _isOpen ? _closeMenu() : _openMenu(),
        kind: CButtonKind.ghost,
        isEnabled: _isEnabled,
        size: switch (widget.props.size) {
          COverflowMenuSize.regular => CButtonSize.regular,
          COverflowMenuSize.sm => CButtonSize.small,
          COverflowMenuSize.md => CButtonSize.medium,
        },
        materialStateController: _materialStatesController,
        style: buttonStyle.copyWith(
          color: buttonStyle.color.copyWith(
            color: Colors.transparent,
            pressedColor: nextLayerColor,
            selectedColor: nextLayerColor,
            animationDuration: COverflowMenuItemStyles.animationDuration,
            animationCurve: COverflowMenuItemStyles.animationCurve,
          ),
          contentColor: CarbonStateColor.all(
            _isOpen ? nextOnLayerColor : iconColor,
            animationDuration: COverflowMenuItemStyles.animationDuration,
            animationCurve: COverflowMenuItemStyles.animationCurve,
          ).copyWith(
            selectedColor: nextOnLayerColor,
          ),
        ),
      ),
    );
  }
}
