import 'package:carbon_flutter/features/overflow_menu/overflow_menu_item.styles.dart';
import 'package:flutter/widgets.dart';

import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

class COverflowMenuBaseProps {
  /// A list of [COverflowMenuItem] to display in a column when
  /// the menu is open.
  ///
  /// @required
  final List<COverflowMenuItem> items;

  /// The adjustment in position applied to the menu.
  ///
  /// @default: `Offset.zero`
  final Offset menuOffset;

  /// Called after the menu is closed.
  ///
  /// @optional
  final VoidCallback? onClose;

  /// Called after the menu is open.
  ///
  /// @optional
  final VoidCallback? onOpen;

  /// The size of this menu. It can be `regular`, `sm`, or `md`
  ///
  /// @default: `COverflowMenuSize.regular`
  final COverFlowMenuSize size;

  /// Whether you can close the menu by tapping the barrier.
  ///
  /// @default: `true`
  final bool barrierDismissible;

  COverflowMenuBaseProps({
    required this.items,
    required this.menuOffset,
    required this.onClose,
    required this.onOpen,
    required this.size,
    required this.barrierDismissible,
  });
}

class COverflowMenuProps extends COverflowMenuBaseProps {
  /// An object that is used to control the menu.
  ///
  /// @required
  final COverflowMenuController controller;

  /// The [child] contained by the menu.
  ///
  /// @required
  final Widget child;

  COverflowMenuProps({
    required this.controller,
    required this.child,
    required List<COverflowMenuItem> items,
    required Offset menuOffset,
    required VoidCallback? onClose,
    required VoidCallback? onOpen,
    required COverFlowMenuSize size,
    required bool barrierDismissible,
  }) : super(
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        );
}

class COverflowMenuButtonProps extends COverflowMenuBaseProps {
  /// The [icon] of the button.
  ///
  /// @required
  final Widget icon;

  /// Whether the button is enabled.
  ///
  /// @default: `true`
  final bool enable;

  COverflowMenuButtonProps({
    required this.enable,
    required this.icon,
    required List<COverflowMenuItem> items,
    required Offset menuOffset,
    required VoidCallback? onClose,
    required VoidCallback? onOpen,
    required COverFlowMenuSize size,
    required bool barrierDismissible,
  }) : super(
          items: items,
          menuOffset: menuOffset,
          onClose: onClose,
          onOpen: onOpen,
          size: size,
          barrierDismissible: barrierDismissible,
        );
}

class COverflowMenuItemProps {
  /// The content of the item.
  ///
  /// @required
  final COverflowMenuEntry entry;

  /// Whether the item is enabled.
  ///
  /// @default: `true`
  final bool enable;

  /// Whether this item has a divider.
  ///
  /// @default: `false`
  final bool hasDivider;

  COverflowMenuItemProps({
    required this.entry,
    required this.enable,
    required this.hasDivider,
  });
}
