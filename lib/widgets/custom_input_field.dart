import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/custom_textfield.dart';

Widget getInputField(String _totalamount, Size screenSize) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Container(
        height: screenSize.height * 0.25,
        child: textField(digit: _totalamount, screenSize: screenSize),
      ),
    ],
  );
}
