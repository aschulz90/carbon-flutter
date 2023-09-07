part of 'button.widget.dart';

abstract class _CButtonStateBase<T extends _CButtonBase> extends State<T> {
  Size get dimensions => widget.props.size.dimensions;

  bool get isDangerous => widget.props.isDangerous;
  bool hasFocus = false;

  bool get isEnabled {
    return context.inheritedEnable ? widget.props.isEnabled : false;
  }

  late MaterialStatesController _materialStatesController;

  ButtonStyle get _baseButtonStyle => ButtonStyle(
        shape: MaterialStateProperty.all(
          ContinuousRectangleBorder(),
        ),
        minimumSize: MaterialStateProperty.all(widget.props.size.dimensions),
        maximumSize: MaterialStateProperty.all(Size(200, widget.props.size.dimensions.height)),
        splashFactory: NoSplash.splashFactory,
        overlayColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.all(2)),
        animationDuration: Duration(milliseconds: 65),
        elevation: MaterialStateProperty.resolveWith((states) {
          if(states.contains(MaterialState.selected)) {
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
            color: CarbonTheme.layerColor(context).withAlpha(0),
          ),
          dangerColor: carbonTheme.buttonTheme.tertiary.dangerColor.copyWith(
            color: CarbonTheme.layerColor(context).withAlpha(0),
          ),
        ),
      CButtonKind.ghost => carbonTheme.buttonTheme.ghost.copyWith(
          color: carbonTheme.buttonTheme.ghost.color.copyWith(
            color: CarbonTheme.layerColor(context).withAlpha(0),
          ),
          dangerColor: carbonTheme.buttonTheme.ghost.dangerColor.copyWith(
            color: CarbonTheme.layerColor(context).withAlpha(0),
          ),
        ),
    };
  }

  @override
  void initState() {
    super.initState();

    _materialStatesController = widget.props.materialStateController ?? MaterialStatesController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _materialStatesController.addListener(() {
        setState(() {
          hasFocus = _materialStatesController.value.contains(MaterialState.focused);
        });
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // these values aren't set on the first build and need to be set manually here
    if (!isEnabled) {
      _materialStatesController.update(MaterialState.disabled, true);
    }

    if (widget.props.focusNode?.hasFocus == true) {
      _materialStatesController.update(MaterialState.focused, true);
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
        constraints: BoxConstraints.tightFor(height: widget.props.size.dimensions.height),
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
      focusNode: widget.props.focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onTap : null,
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
      focusNode: widget.props.focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onTap : null,
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
      focusNode: widget.props.focusNode,
      statesController: _materialStatesController,
      onPressed: isEnabled ? widget.props.onTap : null,
      style: _baseButtonStyle.copyWith(
        shape: MaterialStateProperty.resolveWith((states) {
          return ContinuousRectangleBorder(
            side: BorderSide(
              color: outerBorder.color.resolve(states),
              width: outerBorder.width.resolve(states),
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
