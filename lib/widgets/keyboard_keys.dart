import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/custom_keyboard_input_button.dart';

Widget keyboardKeys({
  @required String firstKey,
  @required String secondKey,
  @required String thirdKey,
  @required Function onPressFirst,
  @required Function onPressSecond,
  @required Function onPressThird,
  ValueSetter<String> onTextInput,
}) {
  return new Expanded(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        KeypadInputButton(
          label: firstKey,
          onPressed: onPressFirst,
          onTextInput: onTextInput,
        ),
        KeypadInputButton(
          label: secondKey,
          onPressed: onPressSecond,
          onTextInput: onTextInput,
        ),
        KeypadInputButton(
          label: thirdKey,
          onPressed: onPressThird,
          onTextInput: onTextInput,
        ),
      ],
    ),
  );
}
