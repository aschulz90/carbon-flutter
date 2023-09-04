import 'package:flutter/widgets.dart';
import 'package:carbon_flutter/shared/index.dart';

import 'form.widget.dart';

abstract class CFormStyles {
  static const Map<CFormType, EdgeInsets> padding = {
    CFormType.group: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 24),
    CFormType.blank: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 24),
  };
}
