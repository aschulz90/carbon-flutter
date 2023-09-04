part of 'button.widget.dart';

typedef _Styles = CButtonStyles;

abstract class _CButtonStateBase<T extends _CButtonBase> extends State<T> with MaterialStateMixin {
  late CButtonKind kind;
  late Size dimensions;

  bool get isEnabled {
    return context.inheritedEnable ? widget.props.enable : false;
  }

  void _setPressed() {
    addMaterialState(MaterialState.focused);
    addMaterialState(MaterialState.pressed);
  }

  void _unsetPressed() {
    removeMaterialState(MaterialState.focused);
    removeMaterialState(MaterialState.pressed);
  }

  void _setStateVariables() {
    if (!isEnabled) {
      addMaterialState(MaterialState.disabled);
    } else {
      removeMaterialState(MaterialState.disabled);
    }

    kind = widget.props.kind;
    dimensions = _Styles.dimensions[widget.props.size]!;
  }
}
