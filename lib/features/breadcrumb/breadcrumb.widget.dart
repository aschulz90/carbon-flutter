import 'package:carbon_flutter/features/overflow_menu/overflow_menu_item.styles.dart';
import 'package:flutter/widgets.dart';

import 'package:carbon_flutter/features/overflow_menu/index.dart';
import 'package:carbon_flutter/features/text/index.dart';

import 'breadcrumb.props.dart';
import 'breadcrumbitem.widget.dart';

/// The breadcrumb is a secondary navigation pattern that
/// helps a user understand the hierarchy among levels and
/// navigate back through them.
class CBreadcrumb extends StatelessWidget {
  CBreadcrumb({
    Key? key,
    required List<CBreadcrumbItem> children,
    bool noTrailingSlash = true,
    int breadcrumbsLimit = 3,
  })  : assert(breadcrumbsLimit >= 3),
        props = CBreadcrumbProps(
          children: children,
          noTrailingSlash: noTrailingSlash,
          breadcrumbsLimit: breadcrumbsLimit,
        ),
        super(key: key);

  final CBreadcrumbProps props;

  final _menu = COverflowMenuController();
  final _menuKey = GlobalKey();

  List<Widget> _displayAllBreadcrumbs() {
    final divider = CText(
      '/',
      style: TextStyle(
        fontSize: 14,
      ),
    );

    final items = [
      for (final item in props.children) ...[item, divider]
    ];

    if (props.noTrailingSlash) items.removeLast();

    return items;
  }

  List<Widget> _displayOverflowedBreadcrumbs() {
    final breadCrumbs = [...props.children];
    var leadingItems = <CBreadcrumbItem>[];
    var hiddenItems = <CBreadcrumbItem>[];
    var trailingItems = <CBreadcrumbItem>[];

    leadingItems.add(breadCrumbs.removeAt(0));
    trailingItems.add(breadCrumbs.removeLast());
    trailingItems.add(breadCrumbs.removeLast());

    trailingItems = List.from(trailingItems.reversed);

    hiddenItems.addAll(breadCrumbs);

    final overflowItem = COverflowMenu(
      controller: _menu,
      size: COverFlowMenuSize.sm,
      items: _buildMenuItems(hiddenItems),
      child: CBreadcrumbItem(
        key: _menuKey,
        label: '...',
        onTap: (_) {
          _menu.open();
        },
      ),
    );

    final divider = CText(
      '/',
      style: TextStyle(
        fontSize: 14,
      ),
    );

    final items = <Widget>[
      for (final item in leadingItems) ...[item, divider],
      overflowItem,
      divider,
      for (final item in trailingItems) ...[item, divider],
    ];

    if (props.noTrailingSlash) items.removeLast();

    return items;
  }

  List<COverflowMenuItem> _buildMenuItems(List<CBreadcrumbItem> items) {
    return items.map(
      (item) {
        return COverflowMenuItem(
          entry: COverflowMenuEntryButton(
            label: item.props.label,
            onPressed: () {
              item.props.onTap(item.props.url);
              _menu.close();
            },
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: props.children.length > props.breadcrumbsLimit
          ? _displayOverflowedBreadcrumbs()
          : _displayAllBreadcrumbs(),
    );
  }
}
