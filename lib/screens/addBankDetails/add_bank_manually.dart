import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/custom_keyboard_action_button.dart';
import 'package:Honeydu/widgets/custom_keyboard_input_button.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/keyboard_keys.dart';

class AddBankDetailsPage extends StatefulWidget {
  const AddBankDetailsPage({Key key}) : super(key: key);

  @override
  _AddBankDetailsState createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetailsPage>
    with SingleTickerProviderStateMixin {
  Size _screenSize;
  String _totalamount;
  AnimationController controller;
  bool isDotAdded;
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: _screenSize.height / 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Add a bank \n manually',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          //getInputField(_totalamount, _screenSize),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    labelText: 'Routing number',
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey)),
                controller: textEditingController,
                readOnly: true,
                showCursor: true),
          ),
          _keypad,
          ElevatedButtonContainer(
            label: Text("Request"),
            onPress: () {
              if (_totalamount != '0' && _totalamount != null) {
              } else {}
            },
            containerPadding: EdgeInsets.only(bottom: 20),
            verticalPadding: 20,
            circularBorder: 50,
            width: _screenSize.width * 0.85,
          ),
        ],
      ),
    );
  }

  get _keypad {
    return new Container(
        height: _screenSize.width - 80,
        child: new Column(
          children: <Widget>[
            keyboardKeys(
              firstKey: "1",
              secondKey: "2",
              thirdKey: "3",
              onPressFirst: () => _setCurrentDigit("1"),
              onPressSecond: () => _setCurrentDigit("2"),
              onPressThird: () => _setCurrentDigit("3"),
            ),
            keyboardKeys(
              firstKey: "4",
              secondKey: "5",
              thirdKey: "6",
              onPressFirst: () => _setCurrentDigit("4"),
              onPressSecond: () => _setCurrentDigit("5"),
              onPressThird: () => _setCurrentDigit("6"),
            ),
            keyboardKeys(
              firstKey: "7",
              secondKey: "8",
              thirdKey: "9",
              onPressFirst: () => _setCurrentDigit("7"),
              onPressSecond: () => _setCurrentDigit("8"),
              onPressThird: () => _setCurrentDigit("9"),
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  KeypadInputButton(
                    label: ".",
                    onTextInput: null,
                    onPressed: () {
                      if (_totalamount != null && isDotAdded != true) {
                        _setCurrentDigit(".");
                        isDotAdded = true;
                      } else if (_totalamount == null && isDotAdded != true) {
                        _setCurrentDigit("0.");
                        isDotAdded = true;
                      }
                    },
                  ),
                  KeypadInputButton(
                    label: "0",
                    onTextInput: null,
                    onPressed: () {
                      _setCurrentDigit("0");
                    },
                  ),
                  KeypadActionButton(
                    onBackspace: null,
                    label: Icons.backspace,
                    longPress: () {
                      setState(() {
                        _totalamount = null;
                        textEditingController.text = _totalamount;
                      });
                    },
                    onPressed: () {
                      if ((_totalamount != null) && (_totalamount.length > 1)) {
                        setState(() {
                          if (_totalamount[_totalamount.length - 1] == ".")
                            isDotAdded = false;
                          _totalamount = _totalamount.substring(
                              0, (_totalamount.length) - 1);
                          textEditingController.text = _totalamount;
                        });
                      } else if ((_totalamount != null) &&
                          (_totalamount.length == 1)) {
                        setState(() {
                          _totalamount = null;
                          isDotAdded = false;
                          textEditingController.text = _totalamount;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void _setCurrentDigit(String i) {
    if (_totalamount != null) {
      if (i == '0') {
        if (_totalamount == '0') {
          controller.forward(from: 0);
          setState(() {
            _totalamount = "$i";
            textEditingController.text = _totalamount;
          });
        } else if (_totalamount != '0') {
          if (_totalamount.contains('.')) {
            if (!(_totalamount.split('.').first.length > 5 ||
                _totalamount.split('.')[1].length > 1)) {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else {
              //controller.forward(from: 0);
              _totalamount = "$_totalamount$i";
              textEditingController.text = _totalamount;
            }
          } else {
            if (i == '.') {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else if (!(_totalamount.length > 4)) {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else {
              //controller.forward(from: 0);
              _totalamount = "$_totalamount$i";
              textEditingController.text = _totalamount;
            }
          }
        } else {
          controller.forward(from: 0);
        }
      } else {
        if (_totalamount == '0') {
          setState(() {
            _totalamount = "$i";
          });
        } else if (_totalamount != '0') {
          if (_totalamount.contains('.')) {
            if (!(_totalamount.split('.').first.length > 5 ||
                _totalamount.split('.')[1].length > 1)) {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else {
              //controller.forward(from: 0);
              _totalamount = "$_totalamount$i";
              textEditingController.text = _totalamount;
            }
          } else {
            if (i == '.') {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else if (!(_totalamount.length > 4)) {
              setState(() {
                _totalamount = "$_totalamount$i";
                textEditingController.text = _totalamount;
              });
            } else {
              //controller.forward(from: 0);
              _totalamount = "$_totalamount$i";
              textEditingController.text = _totalamount;
            }
          }
        }
      }
    } else {
      controller.forward(from: 0);
      setState(() {
        _totalamount = i;
        textEditingController.text = _totalamount;
      });
    }
  }
}
