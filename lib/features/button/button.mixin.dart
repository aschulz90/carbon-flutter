part of 'button.widget.dart';

abstract class _CButtonStateBase<T extends _CButtonBase> extends State<T> with MaterialStateMixin {
  Size get dimensions => widget.props.size.dimensions;

  bool get isDangerous => widget.props.isDangerous;

  bool get isEnabled {
    return context.inheritedEnable ? widget.props.isEnabled : false;
  }

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

  void _setStateVariables() {
    if (!isEnabled) {

      addMaterialState(MaterialState.disabled);
    } else {
      removeMaterialState(MaterialState.disabled);
    }
  }
}
