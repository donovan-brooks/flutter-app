import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/onboarding2.dart';
import 'package:Honeydu/widgets/buttons.dart';

import '../constants.dart';

class Onboarding3 extends StatefulWidget {
  @override
  _Onboarding3State createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 42.h),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/logo.jpeg",
                width: 280.0.w,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 38.44.w, bottom: 40.h),
            child: Image.asset(
              "assets/images/welcome.png",
              width: 300.0.h,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xffE4E4E4),
                maxRadius: 10.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                backgroundColor: Color(0xffE4E4E4),
                maxRadius: 10.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                backgroundColor: Color(0xff1CA85C),
                maxRadius: 10.sp,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 16.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Track all your payments",
                  style: headingTextStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Honeydu is the best and fastest way to\nget paid from brands. You can send an\ninvoice and get paid with no fees.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff8D8D8D),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CircularButtons(
            backgroundColor: Color(0xff1CA85C),
            borderColor: Color(0xff1CA85C),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Onboarding2()),
              );
            },
            text: "Finish",
            textColor: Colors.white,
            textStyle: buttonTextStyle,
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      )),
    );
  }
}
