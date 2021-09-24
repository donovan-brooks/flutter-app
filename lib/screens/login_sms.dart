import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:Honeydu/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';

class LoginSms extends StatefulWidget {
  @override
  _LoginSmsState createState() => _LoginSmsState();
}

class _LoginSmsState extends State<LoginSms>
    with SingleTickerProviderStateMixin {
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
                      onPressed: () {},
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
                      onPressed: () {
                        if (formFieldKey.currentState.validate()) {}
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Welcome back",
                style: loginSmsTextStyle,
                children: [
                  TextSpan(
                    text: "\n\nSign in instantly with a one-time password,",
                    style: appBarTextStyle,
                    children: [
                      TextSpan(text: "\ndelivered as a text message."),
                    ],
                  ),
                ],
              ),
            ),
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
                    style: TextStyle(
                        fontSize: 34.sp,
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
                        textStyle: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if (value.length < 10 || value.length > 10) {
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
                )),
          ],
        ),
      ),
    );
  }
}
