import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'form.widget.dart';

abstract class CFormStyles {
  static const Map<CFormType, EdgeInsets> padding = {
    CFormType.blank: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
    CFormType.group: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 24),
  };

  static const Map<CFormType, Map<CWidgetState, Color>> backgroundColor = {
    CFormType.blank: {
      CWidgetState.enabled: CColors.gray90,
      CWidgetState.disabled: CColors.gray90,
    },
    CFormType.group: {
      CWidgetState.enabled: CColors.gray100,
      CWidgetState.disabled: CColors.gray100,
    }
  };

  static const Map<CFormType, Map<CWidgetState, Color>> textfieldBackgroundColor = {
    CFormType.blank: {
      CWidgetState.enabled: CColors.gray90,
      CWidgetState.focused: CColors.gray90,
      CWidgetState.disabled: CColors.gray90,
    },
    CFormType.group: {
      CWidgetState.enabled: CColors.gray80,
      CWidgetState.focused: CColors.gray80,
      CWidgetState.disabled: CColors.gray80,
    },
  };
}