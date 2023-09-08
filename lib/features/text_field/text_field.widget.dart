import 'package:carbon_flutter/features/form/index.dart';
import 'package:carbon_flutter/shared/styles/colors.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:carbon_flutter/features/text/index.dart';
import 'package:carbon_flutter/features/enable/index.dart';

import 'text_field.models.dart';

enum CValidationKind { success, warning, error }

enum CTextFieldKind { success, warning, error, primary }

class CTextField extends StatefulWidget {
  const CTextField({
    Key? key,
    this.enable = true,
    this.validator,
    this.autoValidate = false,
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
    this.contextMenuBuilder,
    this.keyboardAppearance,
    this.scrollController,
    this.scrollPhysics,
    this.autofillHints,
    this.inputFormatters,
    this.isRequired = false,
    this.expands = false,
    this.maxLines,
    this.minLines,
    this.maxLengthEnforcement,
    this.maxLength,
    this.textInputAction,
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
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final Brightness? keyboardAppearance;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final TextInputAction? textInputAction;

  final Iterable<String>? autofillHints;
  final List<TextInputFormatter>? inputFormatters;

  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final CValidationResult? Function(String? value)? validator;
  final bool autoValidate;

  @override
  CTextFieldState createState() => CTextFieldState();
}

class CTextFieldState extends State<CTextField> {
  FocusNode? _focusNode;

  bool _isFocused = false;

  CFormState? _cform;
  CValidationResult? _validationResult;

  String? _value;

  void _focusNodeListener() {
    if (_isFocused != _focusNode?.hasFocus) {
      setState(() => _isFocused = _focusNode?.hasFocus == true);
    }
  }

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();;
    _focusNode?.addListener(_focusNodeListener);

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
    if (widget.readOnly) _focusNode?.unfocus();

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _cform?.formFields.remove(this);
    _focusNode?.dispose();
    super.dispose();
  }

  bool get _isEnabled {
    return context.inheritedEnable ? widget.enable : false;
  }

  void _validate(String? text) {
    _validationResult = widget.validator?.call(text);
  }

  bool validate() {
    setState(() {
      _validate(_value);
    });


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
      _focusNode?.unfocus();
    }
  }

  InputBorder? _getBorder(BuildContext context) {
    if(_validationResult?.kind == CValidationKind.error) {
      return Theme.of(context).inputDecorationTheme.errorBorder;
    }

    if(widget.autoValidate) {
      return switch (_validationResult?.kind) {
        CValidationKind.warning => OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: CColors.yellow30, width: 2),
        ),
        CValidationKind.success => OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: CColors.green60, width: 2),
        ),
        _ => null,
      };
    }

    return null;
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
               widget.label!,
              isRequired: widget.isRequired,
              style: theme.inputDecorationTheme.labelStyle,
            ),
            const SizedBox(height: 8)
          ],
          SizedBox(
            height: widget.expands ? null : 40,
            child: TextField(
              controller: widget.controller,
              focusNode: _focusNode,
              keyboardType: widget.keyboardType,
              textCapitalization: widget.textCapitalization,
              textAlignVertical: TextAlignVertical.center,
              textDirection: widget.textDirection,
              readOnly: widget.readOnly,
              contextMenuBuilder: widget.contextMenuBuilder,
              enabled: _isEnabled,
              maxLength: widget.maxLength,
              maxLengthEnforcement: widget.maxLengthEnforcement,
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              expands: widget.expands,
              textInputAction: widget.textInputAction,
              canRequestFocus: _isEnabled,
              showCursor: widget.showCursor,
              autofocus: widget.autofocus,
              obscuringCharacter: widget.obscuringCharacter,
              obscureText: widget.obscureText,
              autocorrect: widget.autocorrect,
              enableSuggestions: widget.enableSuggestions,
              onChanged: (value) {
                setState(() {
                  _value = value;

                  if(widget.autoValidate) {
                    _validate(value);
                  }
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
              style: TextStyle(
                fontSize: 14,
                height: 1,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 14,
                  top: isEnabled && _isFocused ? 8 : 8,
                  bottom: isEnabled && _isFocused ? 12.5 : 15,
                ),
                hintText: widget.hint,
                enabledBorder: _getBorder(context),
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
               _validationResult == null ? widget.description! : _validationResult!.message,
              style: theme.inputDecorationTheme.helperStyle,
            ),
          ],
        ],
      ),
    );
  }
}
