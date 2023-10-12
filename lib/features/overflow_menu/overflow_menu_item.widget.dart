import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu_item.styles.dart';

enum COverflowMenuItemKind { primary, delete }

typedef _Styles = COverflowMenuItemStyles;

/// An item in an overflow menu.
class COverflowMenuItem extends StatefulWidget {
  COverflowMenuItem({
    Key? key,
    required COverflowMenuEntry entry,
    bool enable = true,
    bool hasDivider = false,
  })  : props = COverflowMenuItemProps(
          entry: entry,
          enable: enable,
          hasDivider: hasDivider,
        ),
        super(key: key);

  final COverflowMenuItemProps props;

  @override
  COverflowMenuItemState createState() => COverflowMenuItemState();
}

class COverflowMenuItemState extends State<COverflowMenuItem> with AfterInitMixin {
  late COverflowMenuProps _menuProps;

  @override
  void didInitState() {
    _menuProps = COverflowMenu.of(context).props;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: _Styles.animationCurve,
      duration: _Styles.animationDuration,
      height: _menuProps.size.itemSize.height,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: widget.props.hasDivider ? BorderSide(color: _Styles.dividerColor) : BorderSide.none,
        ),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: _menuProps.size.itemSize.width,
          maxWidth: _menuProps.size.itemSize.width,
        ),
        child: widget.props.entry,
      ),
    );
  }
}

abstract class COverflowMenuEntry extends StatelessWidget {
  const COverflowMenuEntry({super.key});
}

class COverflowMenuEntryButton extends COverflowMenuEntry {
  const COverflowMenuEntryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isDangerous = false,
    this.isEnabled = true,
    this.icon,
    this.focusNode,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isDangerous;
  final Widget? icon;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final menu = COverflowMenu.of(context);
    final menuProps = menu.props;

    return CButton(
      kind: CButtonKind.ghost,
      size: menuProps.size.buttonSize,
      expand: true,
      isDangerous: isDangerous,
      label: label,
      onPressed: () {
        onPressed();
        menu.close();
      },
      icon: icon,
      focusNode: focusNode,
      style: CarbonTheme.of(context).buttonTheme.ghost.copyWith(
            color: CarbonStateColor.fromMaterial(CLayer.layerColor(context)),
            contentColor: CarbonStateColor.fromMaterial(CLayer.onLayerColor(context)),
          ),
    );
  }
}
