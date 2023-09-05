import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'breadcrumbitem.props.dart';
import 'breadcrumbitem.styles.dart';

typedef _Styles = CBreadcrumbItemStyles;

/// A ghost button with a short and clear text that reflects a
/// location or an entity it links to.
class CBreadcrumbItem extends StatefulWidget {
  CBreadcrumbItem({
    Key? key,
    required Widget child,
    required VoidCallback onTap,
    bool isCurrentPage = false,
  })  : props = CBreadcrumbItemProps(
          child: child,
          isCurrentPage: isCurrentPage,
          onTap: onTap,
        ),
        super(key: key);

  final CBreadcrumbItemProps props;

  @override
  CBreadcrumbItemState createState() => CBreadcrumbItemState();
}

class CBreadcrumbItemState extends State<CBreadcrumbItem> {
  CWidgetState _state = CWidgetState.enabled;

  bool _focused = false;

  void _setStateVariables() {
    if (_focused) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    _setStateVariables();
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: widget.props.onTap,
      onTapDown: (_) => setState(() => _focused = true),
      onTapUp: (_) => setState(() => _focused = false),
      onTapCancel: () => setState(() => _focused = false),
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: _Styles.itemSpacing),
        padding: EdgeInsets.symmetric(
          horizontal: _Styles.itemSpacing,
          vertical: _Styles.itemSpacing,
        ),
        duration: _Styles.animation['duration'],
        curve: _Styles.animation['curve'],
        child: DefaultTextStyle(
          style: theme.textTheme.bodyMedium!.copyWith(
            color: widget.props.isCurrentPage ? null : CColors.blue40,
          ),
          child: widget.props.child,
        ),
      ),
    );
  }
}
