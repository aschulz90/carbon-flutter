import 'package:carbon_flutter/features/form/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carbon_flutter/shared/index.dart';
import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';
import 'package:carbon_flutter/features/inherited_styles/index.dart';

import 'text_field.models.dart';
import 'text_field.styles.dart';

enum CValidationKind { success, warning, error }

enum CTextfieldKind { success, warning, error, primary }

class CTextField extends StatefulWidget {
  const CTextField({
    Key? key,
    this.enable = true,
    this.validator,
    this.label,
    this.hint,
    this.description,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.onEditingComplete,
    this.onChanged,
    this.onSubmitted,
    this.obscuringCharacter = '•',
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.textCapitalization = TextCapitalization.none,
    this.textDirection,
    this.toolbarOptions,
    this.keyboardAppearance,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.inputFormatters,
    this.isRequired = false,
  }) : super(key: key);

  final bool enable;

  final String? label;
  final String? hint;
  final String? description;
  final String obscuringCharacter;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool isRequired;
  final bool obscureText;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;
  final TextDirection? textDirection;
  final ToolbarOptions? toolbarOptions;
  final Brightness? keyboardAppearance;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final CValidationResult? Function(String? value)? validator;

  @override
  CTextFieldState createState() => CTextFieldState();
}

class CTextFieldState extends State<CTextField> {
  late FocusNode _focusNode;

  CWidgetState _state = CWidgetState.enabled;

  bool _isFocused = false;

  CFormState? _cform;
  CValidationResult? _validationResult;

  String? _value;

  void _focusNodeListener() {
    if (_isFocused != _focusNode.hasFocus) {
      setState(() => _isFocused = _focusNode.hasFocus);
    }
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    } else {
      _focusNode = FocusNode();
    }

    _focusNode.addListener(_focusNodeListener);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _cform = context.cform;
    _cform?.formFields.add(this);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(CTextField oldWidget) {
    if (widget.readOnly) _focusNode.unfocus();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _cform?.formFields.remove(this);
    _focusNode.addListener(_focusNodeListener);
    super.dispose();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.enable : false;
  }

  Color? get inheritedBackgroundColor {
    return context.styles['textfield-background-color']?[_state];
  }

  void _validate(String? text) {
    _validationResult = widget.validator!(text);
  }

  bool validate() {
    if (_value == null) {
      return widget.isRequired ? false : true;
    }

    if (_validationResult == null || _validationResult?.kind == CValidationKind.success) {
      return true;
    } else {
      return false;
    }
  }

  void _setStateVariables() {
    if (!_isEnabled) {
      _focusNode.unfocus();
      _state = CWidgetState.disabled;
    } else if (_isEnabled && (_isFocused || _validationResult != null)) {
      _state = CWidgetState.focused;
    } else {
      _state = CWidgetState.enabled;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = _isEnabled;
    final theme = Theme.of(context);

    _setStateVariables();

    return IgnorePointer(
      ignoring: !isEnabled || widget.readOnly,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (widget.label != null) ...[
            CText(
              data: widget.label!,
              isRequired: widget.isRequired,
              style: theme.inputDecorationTheme.labelStyle,
            ),
            const SizedBox(height: 8)
          ],
          SizedBox(
            height: 40,
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              textAlignVertical: TextAlignVertical.center,
              textDirection: widget.textDirection,
              readOnly: widget.readOnly,
              toolbarOptions: widget.toolbarOptions,
              showCursor: widget.showCursor,
              autofocus: widget.autofocus,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              enableSuggestions: widget.enableSuggestions,
              onChanged: (value) {
                setState(() {
                  _value = value;

                  if (widget.validator != null) _validate(value);
                });

                widget.onChanged?.call(value);
              },
              onEditingComplete: widget.onEditingComplete,
              onSubmitted: widget.onSubmitted,
              inputFormatters: widget.inputFormatters,
              keyboardAppearance: widget.keyboardAppearance,
              onTap: widget.onTap,
              scrollController: widget.scrollController,
              scrollPhysics: widget.scrollPhysics,
              autofillHints: widget.autofillHints,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 14,
                  top: isEnabled && _isFocused ? 8 : 8,
                  bottom: isEnabled && _isFocused ? 12.5 : 15,
                ),
                hintText: widget.hint,
                enabledBorder: switch (_validationResult?.kind) {
                  CValidationKind.error => Theme.of(context).inputDecorationTheme.errorBorder,
                  _ => null,
                },
                prefixIconConstraints: BoxConstraints(minWidth: 46, maxWidth: 46),
                // 44 + 2 (width of border)
                suffixIconConstraints: BoxConstraints(minWidth: 46, maxWidth: 46),
                // 44 + 2 (width of border)
                prefixIcon: widget.prefixIcon,
                suffixIcon: (() {
                  if (widget.suffixIcon == null && _validationResult?.icon == null) return null;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _validationResult?.icon ?? widget.suffixIcon,
                  );
                })(),
              ),
            ),
          ),
          if (widget.description != null) ...[
            const SizedBox(height: 8),
            CText(
              data: _validationResult == null ? widget.description! : _validationResult!.message,
              style: theme.inputDecorationTheme.helperStyle,
            ),
          ],
        ],
      ),
    );
  }
}
