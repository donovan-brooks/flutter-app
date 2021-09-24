import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class Success extends StatelessWidget {
  final String email;

  const Success({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 30.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                iconSize: 40.sp,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 52.82.h),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/success.png",
                width: 280.0.w,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Success!",
              style: TextStyle(
                  fontSize: 41.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          Align(
            alignment: Alignment.center,
            child:
                Text("We have sent your new W-9", style: blackLightTextStyle),
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: 'to',
                style: blackLightTextStyle,
                children: <TextSpan>[
                  TextSpan(
                      text: ' ${email}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
