import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/onboarding3.dart';
import 'package:Honeydu/widgets/buttons.dart';

import '../constants.dart';

class Onboarding2 extends StatefulWidget {
  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff57BC85),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 38.44.w, bottom: 40.h, top: 90.h),
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
                backgroundColor: Color(0xff1CA85C),
                maxRadius: 10.sp,
              ),
              SizedBox(
                width: 10.w,
              ),
              CircleAvatar(
                backgroundColor: Color(0xffE4E4E4),
                maxRadius: 10.sp,
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 50.h, bottom: 16.h, left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Get paid instantly",
                  style: whiteLargeTextStyle,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Honeydu is the best and fastest way to\nget paid from brands. You can send an\ninvoice and get paid with no fees.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          CircularButtons(
            backgroundColor: Colors.white,
            borderColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Onboarding3()),
              );
            },
            text: "Next",
            textColor: Color(0xff1CA85C),
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
