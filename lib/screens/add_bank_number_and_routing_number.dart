import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/custom_keybutton_widget.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class AddBankAndRoutingNumber extends StatefulWidget {
  AddBankAndRoutingNumber({Key key, this.isAccountNumber = true})
      : super(key: key);
  final bool isAccountNumber;

  @override
  _AddBankAndRoutingNumberState createState() =>
      _AddBankAndRoutingNumberState();
}

class _AddBankAndRoutingNumberState extends State<AddBankAndRoutingNumber>
    with SingleTickerProviderStateMixin {
  Size _screenSize;
  String _number;
  bool isDotAdded;
  bool isAccountNumber;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    isAccountNumber = widget.isAccountNumber;
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  get _keypad {
    return new Container(
        height: _screenSize.width - 80,
        child: new Column(
          children: <Widget>[
            newKeyboardKeys(
              firstKey: "1",
              secondKey: "2",
              thirdKey: "3",
              onPressFirst: () => _setCurrentDigit("1"),
              onPressSecond: () => _setCurrentDigit("2"),
              onPressThird: () => _setCurrentDigit("3"),
            ),
            newKeyboardKeys(
              firstKey: "4",
              secondKey: "5",
              thirdKey: "6",
              onPressFirst: () => _setCurrentDigit("4"),
              onPressSecond: () => _setCurrentDigit("5"),
              onPressThird: () => _setCurrentDigit("6"),
            ),
            newKeyboardKeys(
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
                  NewKeyButton(
                    label: ".",
                    onPressed: () {
                      if (_number != null && isDotAdded != true) {
                        _setCurrentDigit(".");
                        isDotAdded = true;
                      } else if (_number == null && isDotAdded != true) {
                        _setCurrentDigit("0.");
                        isDotAdded = true;
                      }
                    },
                  ),
                  NewKeyButton(
                    label: "0",
                    onPressed: () {
                      _setCurrentDigit("0");
                    },
                  ),
                  NewKeyboardActionButton(
                    label: Icons.backspace,
                    longPress: () {
                      setState(() {
                        _number = null;
                      });
                    },
                    onPressed: () {
                      if ((_number != null) && (_number.length > 1)) {
                        setState(() {
                          if (_number[_number.length - 1] == ".")
                            isDotAdded = false;
                          _number = _number.substring(0, (_number.length) - 1);
                        });
                      } else if ((_number != null) && (_number.length == 1)) {
                        setState(() {
                          _number = null;
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

  // Current digit
  void _setCurrentDigit(String i) {
    if (_number != null) {
      if (i == '0') {
        if (_number == '0') {
          controller.forward(from: 0);
          setState(() {
            _number = "$i";
          });
        } else if (_number != '0') {
          if (_number.contains('.')) {
            if (!(_number.split('.').first.length > 12 ||
                _number.split('.')[1].length > 1)) {
              setState(() {
                _number = "$_number$i";
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '.') {
              setState(() {
                _number = "$_number$i";
              });
            } else if (!(_number.length > 11)) {
              setState(() {
                _number = "$_number$i";
              });
            } else {
              controller.forward(from: 0);
            }
          }
        } else {
          controller.forward(from: 0);
        }
      } else {
        if (_number == '0') {
          setState(() {
            _number = "$i";
          });
        } else if (_number != '0') {
          if (_number.contains('.')) {
            if (!(_number.split('.').first.length > 12 ||
                _number.split('.')[1].length > 1)) {
              setState(() {
                _number = "$_number$i";
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '.') {
              setState(() {
                _number = "$_number$i";
              });
            } else if (!(_number.length > 11)) {
              setState(() {
                _number = "$_number$i";
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
        _number = i;
      });
    }
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      size: 40.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Text(
                "Add a bank\nmanually",
                style: extraLargeBlackTextStyle,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: TextWidget(
                      text:
                          isAccountNumber ? "Account Number" : "Routing Number",
                      color: Colors.grey,
                    ),
                  ),
                  AnimatedBuilder(
                    animation: offsetAnimation,
                    builder: (context, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: offsetAnimation.value + 24.0,
                          right: 24.0 - offsetAnimation.value,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          child: Row(
                            children: [
                              TextWidget(
                                text: _number ?? '',
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                              Spacer(),
                              Icon(
                                Icons.lock,
                                color: Colors.greenAccent,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _screenSize.height * 0.03,
            ),
            _keypad,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: ElevatedButtonContainer(
                label: Text(
                  isAccountNumber ? "Add bank" : "Add routing",
                  style: TextStyle(
                      color:
                          (_number != null) ? Colors.white : Color(0xFF4A4A4A)),
                ),
                color: Colors.black,
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddBankAndRoutingNumber(
                                isAccountNumber: false,
                              )));
                },
                containerPadding: EdgeInsets.only(bottom: 20),
                verticalPadding: 20,
                circularBorder: 50,
                width: _screenSize.width * 0.85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
