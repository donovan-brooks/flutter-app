import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/custom_keyboard_action_button.dart';
import 'package:Honeydu/widgets/custom_keyboard_input_button.dart';
import 'package:Honeydu/widgets/keyboard_keys.dart';

class CustomKeyboard extends StatelessWidget {
  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final Size screenSize;
  final VoidCallback onPressFirst;
  final VoidCallback onPressSecond;
  final VoidCallback onPressThird;

  const CustomKeyboard({
    Key key,
    this.onTextInput,
    this.onBackspace,
    this.screenSize,
    this.onPressFirst,
    this.onPressSecond,
    this.onPressThird,
  }) : super(key: key);

  void _textInputHandler(String text) => onTextInput?.call(text);

  void _backspaceHandler() => onBackspace?.call();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.width - 80,
      child: new Column(
        children: <Widget>[
          keyboardKeys(
            firstKey: "1",
            secondKey: "2",
            thirdKey: "3",
            onTextInput: _textInputHandler,
            onPressFirst: onPressFirst,
            onPressSecond: onPressSecond,
            onPressThird: onPressThird,
          ),
          keyboardKeys(
            firstKey: "4",
            secondKey: "5",
            thirdKey: "6",
            onTextInput: _textInputHandler,
            onPressFirst: onPressFirst,
            onPressSecond: onPressSecond,
            onPressThird: onPressThird,
          ),
          keyboardKeys(
            firstKey: "7",
            secondKey: "8",
            thirdKey: "9",
            onTextInput: _textInputHandler,
            onPressFirst: null,
            onPressSecond: null,
            onPressThird: null,
          ),
          new Expanded(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                KeypadInputButton(
                  label: "",
                  onPressed: null,
                  onTextInput: null,
                ),
                KeypadInputButton(
                  label: "0",
                  onTextInput: _textInputHandler,
                  onPressed: null,
                ),
                KeypadActionButton(
                  label: Icons.chevron_left,
                  onBackspace: _backspaceHandler,
                  longPress: null,
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
