import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:Honeydu/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:Honeydu/screens/verify_number.dart';
import 'package:Honeydu/services/signin_services.dart';

class EnterPhone extends StatefulWidget {
  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone>
    with SingleTickerProviderStateMixin {
  String phoneCode;
  String phoneNumber;
  AnimationController controller;
  GlobalKey<FormFieldState> formFieldKey = GlobalKey<FormFieldState>();

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 34.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 30.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.black,
                      ),
                      iconSize: 40.sp,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6.0.h, right: 27.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        child: AutoSizeText(
                          "SEND CODE",
                          style: appBarTextStyle,
                        ),
                        onPressed: () async {
                          if (formFieldKey.currentState.validate()) {
                            var response = await signIn(
                                phoneNumber:
                                    (phoneCode != null && phoneNumber != null)
                                        ? phoneCode + phoneNumber
                                        : null);
                            response != null
                                ? showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return new AlertDialog(
                                        title: new Text(
                                          response[1],
                                          style: kErrorMessage,
                                        ),
                                        content: new Text(
                                          response[2],
                                          style: kErrorMessage,
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                (response[0] != "200")
                                                    ? Navigator.pop(context)
                                                    : {
                                                        Navigator.pop(context),
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                VerifyNumber(
                                                              phoneNumber:
                                                                  phoneCode +
                                                                      phoneNumber,
                                                            ),
                                                          ),
                                                        ),
                                                      },
                                            child: (response[0] != "200")
                                                ? Text("Retry",
                                                    style: kErrorMessage)
                                                : Text("Verify",
                                                    style: kErrorMessage),
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : Container();
                          }
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Please confirm your ",
                  style: loginSmsTextStyle,
                )),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "phone number ",
                  style: loginSmsTextStyle,
                )),
            SizedBox(
              height: 40.h,
            ),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Sign in instantly with a one-time password,",
                  style: appBarTextStyle,
                )),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "delivered as a text message.",
                  style: appBarTextStyle,
                )),
            SizedBox(
              height: 68.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: AutoSizeText(
                "Phone Number",
                style: appBarTextStyle,
              ),
            ),
            AnimatedBuilder(
              animation: offsetAnimation,
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 34.w - offsetAnimation.value,
                    right: offsetAnimation.value + 34.w,
                  ),
                  child: TextFormField(
                    key: formFieldKey,
                    onChanged: (number) {
                      phoneNumber = number;
                    },
                    style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.black),
                    keyboardType: TextInputType.number,
                    cursorHeight: 50.h,
                    cursorColor: Colors.black,
                    showCursor: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff99ABA5), width: 0.2),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff99ABA5), width: 0.2),
                      ),
                      prefixIcon: CountryCodePicker(
                        initialSelection: "US",
                        onInit: (countryCode) {
                          phoneCode = countryCode.toString();
                        },
                        onChanged: (countryCode) {
                          phoneCode = countryCode.toString();
                        },
                        textStyle: TextStyle(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value.length < 10) {
                        controller.forward(from: 0);
                        return '';
                      } else if (value.length > 10) {
                        controller.forward(from: 0);
                        return '';
                      } else if (value.length == 0) {
                        controller.forward(from: 0);
                        return '';
                      } else
                        return null;
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 62.h,
            ),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                "Mobile messaging rates may apply.",
                style: appBarTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
