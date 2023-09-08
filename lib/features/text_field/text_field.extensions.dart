import 'text_field.widget.dart';

extension CValidationKindExtension on CValidationKind {
  CTextFieldKind get toTextFieldKind {
    if (this == CValidationKind.success) return CTextFieldKind.success;
    if (this == CValidationKind.warning) return CTextFieldKind.warning;
    return CTextFieldKind.error;
  }
}
