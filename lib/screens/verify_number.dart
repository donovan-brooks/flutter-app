import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/bottom_bar.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';
import 'package:Honeydu/services/verify_otp_services.dart';
import 'package:Honeydu/widgets/confetti_page.dart';

import '../constants.dart';

class VerifyNumber extends StatefulWidget {
  final String phoneNumber;
  VerifyNumber({@required this.phoneNumber});
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  String otp;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 10.95.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 32.w,
                ),
                child: IconButton(
                  iconSize: 40,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.chevron_left),
                  color: Color(0xff000000),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 23.0.w),
                child: InkWell(
                  onTap: () async {
                    if (otp != null && otp.length == 4) {
                      var response = await verifyOtp(
                        phoneNumber: widget.phoneNumber,
                        otp: otp,
                      );
                      if (response.status != 200) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return new AlertDialog(
                              title: new Text(response.errorMessage),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "Retry",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        List<String> _result = [];
                        _result.insert(0, "Bearer ${response.token}");
                        _result.insert(1, response.id.toString());
                        _result.insert(2, response.name);
                        _result.insert(3, response.email);
                        _result.insert(4, response.companyName);
                        savePreferences(_result);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ConfettiPage(route: BottomBar()),
                          ),
                          (route) => false,
                        );
                      }
                    }
                  },
                  child: Text(
                    "SEND CODE",
                    style: appBarTextStyle,
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 104.93.h),
          Padding(
            padding: EdgeInsets.only(
              left: 136.w,
            ),
            child: Text(
              "Enter your code",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 112.w),
            child: Text(
              "Code sent to 815 302 8613",
              style: appBarTextStyle,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          PinCodeFields(
            length: 4,
            onChange: (code) {
              this.otp = code;
            },
            obscureText: false,
            fieldBorderStyle: FieldBorderStyle.Square,
            responsive: false,
            fieldHeight: 67.0.h,
            fieldWidth: 55.0.w,
            borderWidth: 1.0,
            activeBorderColor: Color(0xff1CA85C),
            activeBackgroundColor: Color(0xff85DCBA),
            borderRadius: BorderRadius.circular(5.0),
            keyboardType: TextInputType.number,
            autoHideKeyboard: false,
            fieldBackgroundColor: Color(0xffE4E4E4),
            autofocus: true,
            borderColor: Color(0xffE4E4E4),
          ),
          SizedBox(
            height: 67.h,
          ),
          Center(
            child: InkWell(
              child: Text(
                "Didn’t get a code?",
                style: appBarTextStyle,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {},
              child: Text("Resend code",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w300,
                      color: lightGreyColor)),
            ),
          ),
        ],
      ),
    ));
  }
}
