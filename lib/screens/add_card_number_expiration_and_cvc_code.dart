import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/custom_keybutton_widget.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class AddCardNumberExpirationAndCvc extends StatefulWidget {
  AddCardNumberExpirationAndCvc(
      {Key key, this.isDebitCard = false, this.isExpiryDate = false})
      : super(key: key);

  final bool isDebitCard, isExpiryDate;

  @override
  _AddCardNumberExpirationAndCvcState createState() =>
      _AddCardNumberExpirationAndCvcState();
}

class _AddCardNumberExpirationAndCvcState
    extends State<AddCardNumberExpirationAndCvc>
    with SingleTickerProviderStateMixin {
  Size _screenSize;
  String _number;
  bool isDotAdded;
  bool isDebitCard, isExpiryDate;
  AnimationController controller;

  get _keypad {
    return new Container(
        height: _screenSize.width - 80,
        child: new Column(
          children: <Widget>[
            newKeyboardKeys(
              firstKey: "1",
              secondKey: "2",
              thirdKey: "3",
              onPressFirst: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("1")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("1")
                      : _setCurrentDigitForCVC("1"),
              onPressSecond: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("2")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("2")
                      : _setCurrentDigitForCVC("2"),
              onPressThird: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("3")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("3")
                      : _setCurrentDigitForCVC("3"),
            ),
            newKeyboardKeys(
              firstKey: "4",
              secondKey: "5",
              thirdKey: "6",
              onPressFirst: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("4")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("4")
                      : _setCurrentDigitForCVC("4"),
              onPressSecond: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("5")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("5")
                      : _setCurrentDigitForCVC("5"),
              onPressThird: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("6")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("6")
                      : _setCurrentDigitForCVC("6"),
            ),
            newKeyboardKeys(
              firstKey: "7",
              secondKey: "8",
              thirdKey: "9",
              onPressFirst: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("7")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("7")
                      : _setCurrentDigitForCVC("7"),
              onPressSecond: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("8")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("8")
                      : _setCurrentDigitForCVC("8"),
              onPressThird: () => isDebitCard
                  ? _setCurrentDigitForDebitCard("9")
                  : isExpiryDate
                      ? _setCurrentDigitForExpirationDate("9")
                      : _setCurrentDigitForCVC("9"),
            ),
            new Expanded(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NewKeyButton(
                    label: isExpiryDate ? "/" : ".",
                    onPressed: () {
                      if (_number != null && isDotAdded != true) {
                        isDebitCard
                            ? _setCurrentDigitForDebitCard("0")
                            : isExpiryDate
                                ? _setCurrentDigitForExpirationDate("/")
                                : _setCurrentDigitForCVC("0");
                        isDotAdded = true;
                      } else if (_number == null && isDotAdded != true) {
                        isDebitCard
                            ? _setCurrentDigitForDebitCard("0.")
                            : isExpiryDate
                                ? _setCurrentDigitForExpirationDate("/")
                                : _setCurrentDigitForCVC("0.");
                        isDotAdded = true;
                      }
                    },
                  ),
                  NewKeyButton(
                    label: "0",
                    onPressed: () {
                      isDebitCard
                          ? _setCurrentDigitForDebitCard("0")
                          : isExpiryDate
                              ? _setCurrentDigitForExpirationDate("0")
                              : _setCurrentDigitForCVC("0");
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
                          if (_number[_number.length - 1] == "." ||
                              _number[_number.length - 1] == "/")
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
  void _setCurrentDigitForCVC(String i) {
    if (_number != null) {
      if (i == '0') {
        if (_number == '0') {
          controller.forward(from: 0);
          setState(() {
            _number = "$i";
          });
        } else if (_number != '0') {
          if (_number.contains('.')) {
            if (!(_number.split('.').first.length > 4 ||
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
            } else if (!(_number.length > 3)) {
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
            if (!(_number.split('.').first.length > 4 ||
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
            } else if (!(_number.length > 3)) {
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

  void _setCurrentDigitForDebitCard(String i) {
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

  void _setCurrentDigitForExpirationDate(String i) {
    if (_number != null) {
      if (i == '0') {
        if (_number == '0') {
          controller.forward(from: 0);
          setState(() {
            _number = "0$i";
          });
        } else if (_number != '0') {
          if (_number.contains('/')) {
            if (!(_number.split('/').first.length > 4 ||
                _number.split('/')[1].length > 1)) {
              setState(() {
                _number = "$_number$i";
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '/') {
              setState(() {
                _number = "$_number$i";
              });
            } else if (!(_number.length > 3)) {
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
            _number = "0$i";
          });
        } else if (_number != '0') {
          if (_number.contains('/')) {
            if (!(_number.split('/').first.length > 4 ||
                _number.split('/')[1].length > 1)) {
              setState(() {
                _number = "$_number$i";
              });
            } else {
              controller.forward(from: 0);
            }
          } else {
            if (i == '/') {
              setState(() {
                _number = "$_number$i";
              });
            } else if (!(_number.length > 3)) {
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
  void initState() {
    super.initState();
    isDebitCard = widget.isDebitCard;
    isExpiryDate = widget.isExpiryDate;
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
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
                "Add a bank using\nyour debit card",
                style: extraLargeBlackTextStyle,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            if (!isDebitCard && isExpiryDate)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: TextWidget(
                        text: "Expiration Date",
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
                            constraints: BoxConstraints(maxWidth: 150.w),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey),
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
            if (isDebitCard && !isExpiryDate)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: TextWidget(
                        text: "Debit Card Number",
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
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey),
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
            if (!isDebitCard && !isExpiryDate)
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: TextWidget(
                        text: "CVC code",
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
                            constraints: BoxConstraints(maxWidth: 130.w),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Colors.grey),
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
                  isDebitCard ? "Add card" : "Proceed",
                  style: TextStyle(
                      color:
                          (_number != null) ? Colors.white : Color(0xFF4A4A4A)),
                ),
                color: Colors.black,
                onPress: () {
                  if (isDebitCard)
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddCardNumberExpirationAndCvc(
                            isExpiryDate: true,
                          ),
                        ));
                  if (isExpiryDate) Navigator.pop(context);
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
