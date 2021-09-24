import 'package:flutter/cupertino.dart';

class EmailValidation with ChangeNotifier {
  bool isValid = false;

  checkValidity(bool status) {
    isValid = status;
    notifyListeners();
  }
}
