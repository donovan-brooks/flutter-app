import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmail extends StatefulWidget {
  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(right: 40.w, top: 30.h),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color(0xff707070),
                ),
                iconSize: 40.sp,
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 38.44.w),
            child: Image.asset(
              "assets/images/email_icon.png",
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "You haven’t verified",
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                "your email",
                style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          SizedBox(
            height: 48.h,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "We have sent an email",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              )),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'to ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w200),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'jack@coral.global',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: "Didn't get an email? ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w200),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'send again',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15)),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Make sure we have your address right, ",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                "and that the message didn’t end up ",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              )),
          Align(
              alignment: Alignment.center,
              child: Text(
                "in your spam folder.",
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black),
              )),
          SizedBox(
            height: 50.h,
          )
        ],
      )),
    );
  }
}
