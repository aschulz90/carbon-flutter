part of 'button.widget.dart';

abstract class _CButtonStateBase<T extends _CButtonBase> extends State<T> {
  Size get dimensions => widget.props.size.dimensions;

  bool get isDangerous => widget.props.isDangerous;

  bool get isEnabled {
    return context.inheritedEnable ? widget.props.isEnabled : false;
  }

  late MaterialStatesController _materialStatesController;
  FocusNode? _focusNode;

  ButtonStyle get _baseButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
          ContinuousRectangleBorder(),
        ),
        minimumSize: MaterialStateProperty.all(widget.props.size.dimensions),
        maximumSize: MaterialStateProperty.all(
          Size(
            widget.props.constrainMaxSize ? widget.props.size.dimensions.width : 300,
            widget.props.size.dimensions.height,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.all(2)),
        animationDuration: Duration(milliseconds: 65),
        elevation: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return 2;
          }

          return 0;
        }),
      );

  CarbonButtonStyle _getStyle(BuildContext context) {
    final carbonTheme = CarbonTheme.of(context);
    return switch (widget.props.kind) {
      CButtonKind.primary => carbonTheme.buttonTheme.primary,
      CButtonKind.secondary => carbonTheme.buttonTheme.secondary,
      CButtonKind.tertiary => carbonTheme.buttonTheme.tertiary.copyWith(
          color: carbonTheme.buttonTheme.tertiary.color.copyWith(
            color: CLayer.layerColor(context).withAlpha(0),
          ),
          dangerColor: carbonTheme.buttonTheme.tertiary.dangerColor.copyWith(
            color: CLayer.layerColor(context).withAlpha(0),
          ),
        ),
      CButtonKind.ghost => carbonTheme.buttonTheme.ghost.copyWith(
          color: carbonTheme.buttonTheme.ghost.color.copyWith(
            color: CLayer.layerColor(context).withAlpha(0),
          ),
          dangerColor: carbonTheme.buttonTheme.ghost.dangerColor.copyWith(
            color: CLayer.layerColor(context).withAlpha(0),
          ),
        ),
    };
  }

  @override
  void initState() {
    super.initState();

    _materialStatesController = widget.props.materialStateController ?? MaterialStatesController();
    _focusNode = widget.props.focusNode ?? FocusNode();

    _focusNode?.addListener(() {
      setState(() {
        _materialStatesController.update(MaterialState.focused, _focusNode?.hasFocus == true);
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // these values aren't set on the first build and need to be set manually here
    if (!isEnabled) {
      _materialStatesController.value.add(MaterialState.disabled);
    }

    if (_focusNode?.hasFocus == true) {
      _materialStatesController.value.remove(MaterialState.disabled);
    }
  }

  Widget _innerContent(CarbonButtonStyle buttonStyle, double borderPadding);

  Widget _content(CarbonButtonStyle buttonStyle) {
    final innerBorder = (isDangerous ? buttonStyle.dangerInnerBorder : buttonStyle.innerBorder).resolve(_materialStatesController.value);
    return CEnable(
      value: isEnabled,
      child: Container(
        decoration: BoxDecoration(
          border: innerBorder,
        ),
        constraints: BoxConstraints(
          minHeight: widget.props.size.dimensions.height,
          maxHeight: widget.props.size.dimensions.height,
          minWidth: widget.props.size.dimensions.width,
        ),
        child: _innerContent(buttonStyle, innerBorder.dimensions.horizontal / 2),
      ),
    );
  }

  Widget _buildFilledButton(BuildContext context) {
    final buttonStyle = widget.props.style ?? _getStyle(context);
    final backgroundColor = isDangerous ? buttonStyle.dangerColor : buttonStyle.color;
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    final outerBorder = (isDangerous ? buttonStyle.dangerOuterBorder : buttonStyle.outerBorder);

    return FilledButton(
      focusNode: _focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onPressed : null,
      style: _baseButtonStyle.copyWith(
        shape: MaterialStateProperty.resolveWith((states) {
          return ContinuousRectangleBorder(
            side: BorderSide(
              color: outerBorder.color.resolve(states),
              width: outerBorder.width.resolve(states),
            ),
          );
        }),
        backgroundColor: backgroundColor,
        foregroundColor: contentColor,
      ),
      child: _content(buttonStyle),
    );
  }

  Widget _buildTertiaryButton(BuildContext context) {
    final buttonStyle = widget.props.style ?? _getStyle(context);
    final backgroundColor = isDangerous ? buttonStyle.dangerColor : buttonStyle.color;
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    final outerBorder = (isDangerous ? buttonStyle.dangerOuterBorder : buttonStyle.outerBorder);

    return OutlinedButton(
      focusNode: _focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onPressed : null,
      style: _baseButtonStyle.copyWith(
        shape: MaterialStateProperty.resolveWith((states) {
          return ContinuousRectangleBorder(
            side: BorderSide(
              color: outerBorder.color.resolve(states),
              width: outerBorder.width.resolve(states),
            ),
          );
        }),
        side: MaterialStateProperty.resolveWith((states) {
          return BorderSide(
            color: outerBorder.color.resolve(states),
            width: outerBorder.width.resolve(states),
          );
        }),
        foregroundColor: contentColor,
        backgroundColor: backgroundColor,
      ),
      child: _content(buttonStyle),
    );
  }

  Widget _buildGhostButton(BuildContext context) {
    final buttonStyle = widget.props.style ?? _getStyle(context);
    final backgroundColor = isDangerous ? buttonStyle.dangerColor : buttonStyle.color;
    final contentColor = isDangerous ? buttonStyle.dangerContentColor : buttonStyle.contentColor;
    final outerBorder = (isDangerous ? buttonStyle.dangerOuterBorder : buttonStyle.outerBorder);

    return TextButton(
      focusNode: _focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onPressed : null,
      style: _baseButtonStyle.copyWith(
        shape: MaterialStateProperty.resolveWith((states) {
          final color = outerBorder.color.resolve(states);
          final width = outerBorder.width.resolve(states);
          return ContinuousRectangleBorder(
            side: BorderSide(
              color: color,
              width: width,
              style: width > 0 ? BorderStyle.solid : BorderStyle.none,
            ),
          );
        }),
        foregroundColor: contentColor,
        backgroundColor: backgroundColor,
      ),
      child: _content(buttonStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!isEnabled) {
      _materialStatesController.value.add(MaterialState.disabled);
    } else {
      _materialStatesController.value.remove(MaterialState.disabled);
    }

    switch (widget.props.kind) {
      case CButtonKind.primary:
      case CButtonKind.secondary:
        return _buildFilledButton(context);
      case CButtonKind.tertiary:
        return _buildTertiaryButton(context);
      case CButtonKind.ghost:
        return _buildGhostButton(context);
    }
  }
}
