import 'package:carbon_flutter/carbon.dart';
import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
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
    _materialStatesController.update(MaterialState.selected, true);
    _controller.open();
  }

  void _closeMenu() {
    _materialStatesController.update(MaterialState.selected, false);
    _controller.close();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  @override
  void initState() {
    super.initState();
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
    final nextLayerColor = CarbonTheme.layerColor(context, offset: 1);
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
          isDelete: item.props.isDelete,
          onTap: () {
            item.props.onTap?.call();
            _closeMenu();
          },
          child: item.props.child,
        );
      }).toList(),
      child: CButton.icon(
        icon: widget.props.icon,
        onTap: () => _isOpen ? _closeMenu() : _openMenu(),
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
          ),
          contentColor: CarbonStateColor.all(
            iconColor,
          ).copyWith(
            selectedColor: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
