import 'dart:core';
import 'package:carbon_flutter/features/layer/layer.widget.dart';
import 'package:flutter/material.dart';

import 'overflow_menu.props.dart';
import 'overflow_menu.styles.dart';
import 'overflow_menu.util.dart';
import 'overflow_menu_item.widget.dart';

enum COverflowMenuDirection { top, bottom }

enum COverflowMenuSize { regular, sm, md }

typedef _Styles = COverflowMenuStyles;

/// Overflow menu is used when additional options are available
/// to the user and there is a space constraint.
class COverflowMenu extends StatefulWidget {
  COverflowMenu({
    Key? key,
    required COverflowMenuController controller,
    required List<COverflowMenuItem> items,
    required Widget child,
    VoidCallback? onOpen,
    VoidCallback? onClose,
    bool barrierDismissible = true,
    Offset menuOffset = Offset.zero,
    COverflowMenuSize size = COverflowMenuSize.regular,
  })  : assert(items.isNotEmpty),
        props = COverflowMenuProps(
          controller: controller,
          barrierDismissible: barrierDismissible,
          items: items,
          menuOffset: menuOffset,
          onOpen: onOpen,
          child: child,
          onClose: onClose,
          size: size,
        ),
        super(key: key);

  final COverflowMenuProps props;

  static COverflowMenuState? maybeOf(BuildContext context) {
    final _OverflowMenuScope? scope = context.dependOnInheritedWidgetOfExactType<_OverflowMenuScope>();
    return scope?._menuState;
  }

  static COverflowMenuState of(BuildContext context) {
    final COverflowMenuState? menuState = maybeOf(context);
    assert(() {
      if (menuState == null) {
        throw FlutterError(
          'COverflowMenu.of() was called with a context that does not contain a COverflowMenu widget.\n'
              'No COverflowMenu widget ancestor could be found starting from the context that '
              'was passed to COverflowMenu.of(). This can happen because you are using a widget '
              'that looks for a COverflowMenu ancestor, but no such ancestor exists.\n'
              'The context used was:\n'
              '  $context',
        );
      }
      return true;
    }());
    return menuState!;
  }

  @override
  COverflowMenuState createState() => COverflowMenuState();
}

class COverflowMenuState extends State<COverflowMenu> with TickerProviderStateMixin {
  final _menuKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<double> _animation;
  late COverflowMenuDirection _direction;
  late Size _screenSize;
  late Offset _menuOffset;
  late COverflowMenuSize _size;

  BuildContext? _childContext;
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;

  bool _isOpen = false;
  bool get isOpen => _isOpen;

  COverflowMenuProps get props => widget.props;

  Size get _menuItemDimension => _Styles.dimensions[_size]!;

  double get _menuWidth => _menuItemDimension.width;
  double get _menuHeight => _menuItemDimension.height * widget.props.items.length;

  bool get _isBottom => _direction == COverflowMenuDirection.bottom;
  bool get _isReady => _menuKey.currentContext != null;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: _Styles.animation['duration']);
    _animation = CurvedAnimation(parent: _animationController, curve: _Styles.animation['curve']);

    widget.props.controller.addListener(() {
      if (_isOpen != widget.props.controller.isOpen) {
        setState(() => _isOpen = widget.props.controller.isOpen);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_menuKey.currentContext != _childContext) {
        setState(() => _childContext = _menuKey.currentContext);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _overlayEntry?.remove();
    super.dispose();
  }

  void close() {
    widget.props.controller.close();
  }

  void open() {
    widget.props.controller.open();
  }

  void _showOverlay() {
    Future.delayed(Duration.zero, () async {
      _size = widget.props.size;
      _screenSize = View.of(context).physicalSize / View.of(context).devicePixelRatio;
      _menuOffset = _calculateMenuOffset();

      // Init the overlay entry.
      _overlayState = Overlay.of(_childContext!);
      _overlayEntry = OverlayEntry(builder: (_) => _buildOverflowMenu());

      _animationController.addListener(_refreshOverlayState);
      _animationController.forward();

      _overlayState!.insert(_overlayEntry!);
      await Future.delayed(_Styles.animation['duration']);
      widget.props.onOpen?.call();
    });
  }

  void _hideOverlay() {
    if (_overlayEntry == null) return;

    _animationController.reverse();

    Future.delayed(_Styles.animation['duration'], () {
      _animationController.removeListener(_refreshOverlayState);
      _overlayEntry?.remove();
      _overlayEntry = null;
      _overlayState = null;

      widget.props.onClose?.call();
    });
  }

  void _refreshOverlayState() {
    _overlayState?.setState(() {});
  }

  Widget _buildOverflowMenu() {
    return _OverflowMenuScope(
      menuState: this,
      child: Stack(
        children: [
          if (widget.props.barrierDismissible)
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragStart: (_) => widget.props.controller.close(),
                onHorizontalDragStart: (_) => widget.props.controller.close(),
                onTap: () => widget.props.controller.close(),
              ),
            ),
          Positioned(
            left: _menuOffset.dx,
            top: _menuOffset.dy,
            child: CLayer(
              layerIndex: CLayer.of(context) + 1,
              builder: (context, layerIndex, layerColor) {
                return Material(
                  color: layerColor,
                  elevation: 4,
                  child: SizeTransition(
                    sizeFactor: _animation,
                    axis: Axis.vertical,
                    child: SizedBox(
                      width: _menuWidth,
                      height: _menuHeight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.props.items,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Rect _calculateChildRect() {
    final renderBox = _childContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    return Rect.fromLTWH(
      offset.dx,
      offset.dy,
      renderBox.size.width,
      renderBox.size.height,
    );
  }

  Offset _calculateMenuOffset() {
    final childRect = _calculateChildRect();

    double dx = childRect.left;
    double dy = childRect.top;

    // If the menu is at the right side of the screen.
    if (dx + _menuWidth > _screenSize.width) {
      dx = dx + childRect.width - _menuWidth;
    }

    if ((dy + _menuHeight + childRect.height) > _screenSize.height) {
      dy -= _menuHeight;
      _direction = COverflowMenuDirection.top;
    } else {
      dy += childRect.height;
      _direction = COverflowMenuDirection.bottom;
    }

    // Add the [props.offset].

    if (_direction == COverflowMenuDirection.bottom) {
      dx += widget.props.menuOffset.dx;
      dy += widget.props.menuOffset.dy;
    } else {
      dx -= widget.props.menuOffset.dx;
      dy -= widget.props.menuOffset.dy;
    }

    return Offset(dx, dy);
  }

  @override
  Widget build(BuildContext context) {
    if (_isReady) {
      _isOpen ? _showOverlay() : _hideOverlay();
    }

    return SizedBox(key: _menuKey, child: widget.props.child);
  }
}

class _OverflowMenuScope extends InheritedWidget {
  const _OverflowMenuScope({
    required super.child,
    required COverflowMenuState menuState,
  }) : _menuState = menuState;

  final COverflowMenuState _menuState;

  /// The [COverflowMenu] associated with this widget.
  COverflowMenu get menu => _menuState.widget;

  @override
  bool updateShouldNotify(_OverflowMenuScope old) => _menuState != old._menuState;
}
