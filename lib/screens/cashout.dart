import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/models/withdraw_money_response.dart';
import 'package:Honeydu/screens/withdraw_success.dart';
import 'package:Honeydu/services/withdraw_money_services.dart';
import 'package:Honeydu/widgets/custom_input_field.dart';
import 'package:Honeydu/widgets/custom_keyboard_action_button.dart';
import 'package:Honeydu/widgets/custom_keyboard_input_button.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/keyboard_keys.dart';
import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class CashOut extends StatefulWidget {
  final String balance;

  const CashOut({Key key, @required this.balance}) : super(key: key);
  @override
  _CashOutState createState() => new _CashOutState();
}

class _CashOutState extends State<CashOut> with SingleTickerProviderStateMixin {
  // Variables
  Size _screenSize;
  String _totalamount;
  bool isDotAdded;
  AnimationController controller;

  get _getAppbar {
    return new AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: new InkWell(
        borderRadius: BorderRadius.circular(30.0),
        child: new Icon(
          Icons.arrow_back,
          color: Colors.black54,
        ),
        onTap: () => Navigator.pop(context),
      ),
      centerTitle: true,
    );
  }

  Widget _getInputPart(Animation<double> offsetAnimation) {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextWidget(
          text: "Withdraw",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
            text: "${widget.balance} available",
            fontSize: 16.0,
            color: Colors.grey),
        Expanded(
          child: AnimatedBuilder(
            animation: offsetAnimation,
            builder: (context, child) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 24 - offsetAnimation.value,
                  right: offsetAnimation.value + 24,
                ),
                child: getInputField(_totalamount, _screenSize),
              );
            },
          ),
        ),
        // TextWidget(text: "Chase bank ****0328", fontSize: 16),
        Expanded(child: _keypad),
        ElevatedButtonContainer(
          label: Text("Withdraw"),
          onPress: () async {
            WithdrawMoneyResponse withdrawMoneyResponse =
                await withdrawMoneyServices(_totalamount);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  withdrawMoneyResponse.status != null
                      ? withdrawMoneyResponse.status.capitalizeFirstofEach
                      : "Failed",
                  style: withdrawMoneyResponse.statusCode == 200
                      ? kSuccessMessage
                      : kErrorMessage,
                ),
                content: withdrawMoneyResponse.errors != null
                    ? new Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (withdrawMoneyResponse.errors != null)
                            Text(
                              "[X]" + withdrawMoneyResponse.errors[0],
                              style: kErrorMessage,
                            ),
                          if (withdrawMoneyResponse.errors != null &&
                              withdrawMoneyResponse.errors.length > 1)
                            Text(
                              "[X]" + withdrawMoneyResponse.errors[1],
                              style: kErrorMessage,
                            ),
                          if (withdrawMoneyResponse.message != null)
                            Text(
                              "[X]" + withdrawMoneyResponse.message,
                              style: withdrawMoneyResponse.statusCode == 200
                                  ? kSuccessMessage
                                  : kErrorMessage,
                            ),
                        ],
                      )
                    : Text(
                        "[X]" + withdrawMoneyResponse.message,
                        style: withdrawMoneyResponse.statusCode == 200
                            ? kSuccessMessage
                            : kErrorMessage,
                      ),
                actions: [
                  TextButton(
                    onPressed: () => (withdrawMoneyResponse.statusCode != 200)
                        ? Navigator.pop(context)
                        : {
                            Navigator.pop(context),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WithdrawSuccess(amount: _totalamount)),
                            ),
                          },
                    child: (withdrawMoneyResponse.statusCode != 200)
                        ? Text(
                            "Retry",
                            style: TextStyle(color: Colors.black),
                          )
                        : Icon(
                            FontAwesomeIcons.arrowRight,
                            color: Colors.green,
                          ),
                  ),
                ],
              ),
            );
            if (withdrawMoneyResponse.statusCode == 200) {
              Future.delayed(
                Duration(seconds: 2),
                () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WithdrawSuccess(amount: _totalamount)),
                  );
                },
              );
            }
          },
          containerPadding: EdgeInsets.only(bottom: 20),
          width: _screenSize.width * 0.85,
          verticalPadding: 20,
          circularBorder: 50,
        ),
      ],
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
                    label: Icons.backspace,
                    onBackspace: null,
                    longPress: () {
                      setState(() {
                        _totalamount = null;
                      });
                    },
                    onPressed: () {
                      if ((_totalamount != null) && (_totalamount.length > 1)) {
                        setState(() {
                          if (_totalamount[_totalamount.length - 1] == ".") {
                            isDotAdded = false;
                          }
                          _totalamount = _totalamount.substring(
                              0, _totalamount.length - 1);
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

  // Overridden methods
  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 20.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppbar,
      backgroundColor: Colors.white,
      body: Container(
        width: _screenSize.width,
        child: _getInputPart(offsetAnimation),
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

  void clearOtp() {
    setState(() {});
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}
