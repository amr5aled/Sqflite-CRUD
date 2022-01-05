import 'package:flutter/cupertino.dart';

import '../resources/app_strings.dart';

class AppValidator {
  static String? validatorRequired(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppStrings.required;
    }
    return null;
  }
}
