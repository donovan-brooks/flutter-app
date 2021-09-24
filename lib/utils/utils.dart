import 'package:flutter/material.dart';

Utils utils = Utils();

class Utils {

  static final Utils _utils = Utils._i();

  factory Utils() {
    return _utils;
  }

  Utils._i();

  void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}