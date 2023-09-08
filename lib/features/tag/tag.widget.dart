import 'package:carbon_flutter/carbon.dart';
import 'package:flutter/material.dart';

class CTag extends StatefulWidget {
  CTag({
    super.key,
    required String label,
    bool enabled = true,
    CTagStyle? style,
    CTagSize size = CTagSize.md,
  }) : props = CTagProps(
          enabled: enabled,
          label: label,
          style: style ?? CTagStyle.red,
          size: size,
        );

  CTag.filter({
    super.key,
    required String label,
    required VoidCallback? onFilterPressed,
    bool enabled = true,
    CTagStyle? style,
    CTagSize size = CTagSize.md,
  }) : props = CTagProps(
          enabled: enabled,
          label: label,
          onFilterPressed: onFilterPressed,
          style: style ?? CTagStyle.red,
          size: size,
        );

  CTag.disabled({
    super.key,
    required String label,
    CTagSize size = CTagSize.md,
  }) : props = CTagProps(
          enabled: false,
          label: label,
          style: CTagStyle.disabled,
          size: size,
        );

  /// {@macro tag_props}
  final CTagProps props;

  @override
  State<CTag> createState() => _CTagState();
}

class _CTagState extends State<CTag> with MaterialStateMixin {
  bool get isFilter => widget.props.onFilterPressed != null;

  bool get _isEnabled {
    return context.inheritedEnable ? widget.props.enabled : false;
  }

  CTagStyle get style => _isEnabled ? widget.props.style : CTagStyle.disabled;

  Widget _filter(BuildContext context) {
    return FilledButton(
      onPressed: _isEnabled ? widget.props.onFilterPressed : null,
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: widget.props.size.borderRadius,
            side: style.border(context),
          ),
        ),
        backgroundColor: style.background(context),
        foregroundColor: style.content(context),
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
        visualDensity: VisualDensity(vertical: -4, horizontal: -4),
        minimumSize: MaterialStatePropertyAll(Size(0, CTagSize.sm.height)),
      ),
      child: SizedBox(
        height: widget.props.size.height,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CText(
              widget.props.label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    height: 1,
                    color: style.content(context).resolve(materialStates),
                  ),
            ),
            Icon(
              Icons.close,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isFilter) {
      return _filter(context);
    }

    return MouseRegion(
      onEnter: (event) => addMaterialState(MaterialState.hovered),
      onExit: (event) => removeMaterialState(MaterialState.hovered),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: widget.props.size.height,
        decoration: ShapeDecoration(
          color: style.background(context).resolve(materialStates),
          shape: RoundedRectangleBorder(
            borderRadius: widget.props.size.borderRadius,
            side: style.border(context),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CText(
                widget.props.label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: style.content(context).resolve(materialStates),
                      height: 1,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
