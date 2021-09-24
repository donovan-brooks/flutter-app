import 'package:flutter/material.dart';
import 'package:Honeydu/screens/request_invoice/request_money_2.dart';
import 'package:Honeydu/widgets/custom_input_field.dart';
import 'package:Honeydu/widgets/custom_keyboard_action_button.dart';
import 'package:Honeydu/widgets/custom_keyboard_input_button.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/keyboard_keys.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class RequestMoney extends StatefulWidget {
  @override
  _RequestMoneyState createState() => new _RequestMoneyState();
}

class _RequestMoneyState extends State<RequestMoney>
    with SingleTickerProviderStateMixin {
  // Variables
  Size _screenSize;
  String _totalamount;
  bool isDotAdded;
  bool showMininumAmountMessage = false;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  get _getAppbar {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          child: Text(
            'C',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
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
                    onTextInput: null,
                    label: ".",
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
                    onTextInput: null,
                    label: "0",
                    onPressed: () {
                      _setCurrentDigit("0");
                    },
                  ),
                  KeypadActionButton(
                    onBackspace: null,
                    label: Icons.arrow_back,
                    longPress: () {
                      setState(() {
                        _totalamount = null;
                      });
                    },
                    onPressed: () {
                      if ((_totalamount != null) && (_totalamount.length > 1)) {
                        setState(() {
                          if (_totalamount[_totalamount.length - 1] == ".")
                            isDotAdded = false;
                          _totalamount = _totalamount.substring(
                              0, (_totalamount.length) - 1);
                        });
                      } else if ((_totalamount != null) &&
                          (_totalamount.length == 1)) {
                        setState(() {
                          _totalamount = null;
                          isDotAdded = false;
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 24.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    _screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: _getAppbar,
      backgroundColor: Colors.white,
      body: new Container(
        width: _screenSize.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 12,
            ),
            if (showMininumAmountMessage)
              TextWidget(
                text: '\$1 is the minimum to request',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            AnimatedBuilder(
                animation: offsetAnimation,
                builder: (buildContext, child) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 24.0),
                    padding: EdgeInsets.only(
                        left: offsetAnimation.value + 24.0,
                        right: 24.0 - offsetAnimation.value),
                    child: getInputField(_totalamount, _screenSize),
                  );
                }),
            _keypad,
            ElevatedButtonContainer(
              label: Text("Request"),
              onPress: () {
                if (_totalamount != '0' && _totalamount != null) {
                  setState(() {
                    showMininumAmountMessage = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestMoney2(
                        totalAmount: _totalamount != null
                            ? double.parse(_totalamount)
                            : 0.0,
                      ),
                    ),
                  );
                } else
                  setState(() {
                    showMininumAmountMessage = true;
                  });
              },
              containerPadding: EdgeInsets.only(bottom: 20),
              verticalPadding: 20,
              circularBorder: 50,
              width: _screenSize.width * 0.85,
            ),
          ],
        ),
      ),
    );
  }

  // Current digit
  void _setCurrentDigit(String i) {
    if (_totalamount != null) {
      if (i == '0') {
        if (_totalamount == '0') {
          controller.forward(from: 0);
          setState(() {
            _totalamount = "$i";
          });
        } else if (_totalamount != '0') {
          if (_totalamount.contains('.')) {
            if (!(_totalamount.split('.').first.length > 5 ||
                _totalamount.split('.')[1].length > 1)) {
              setState(() {
                _totalamount = "$_totalamount$i";
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '.') {
              setState(() {
                _totalamount = "$_totalamount$i";
              });
            } else if (!(_totalamount.length > 4)) {
              setState(() {
                _totalamount = "$_totalamount$i";
              });
            } else {
              controller.forward(from: 0);
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
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '.') {
              setState(() {
                _totalamount = "$_totalamount$i";
              });
            } else if (!(_totalamount.length > 4)) {
              setState(() {
                _totalamount = "$_totalamount$i";
              });
            } else {
              controller.forward(from: 0);
            }
          }
        }
      }
    } else {
      controller.forward(from: 0);
      setState(() {
        _totalamount = i;
      });
    }
  }
}
