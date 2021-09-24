import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class Complete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 13.w),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  "CLOSE",
                  style: appBarTextStyle,
                ),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //circle
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Color(0xff1CA85C),
                    ),
                  ),
                ),
                //progress bar
                Container(
                  //width: 120.w,
                  width:
                      (MediaQuery.of(context).size.width - 90 - (10 * 3)) / 2,
                  height: 2.h,
                  color: Color(0xff1CA85C),
                ),
                //circle point
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Color(0xff1CA85C),
                  ),
                ),
                //ptogress bar
                Container(
                  width:
                      (MediaQuery.of(context).size.width - 100 - (10 * 8)) / 2,
                  height: 2.h,
                  color: Color(0xff1CA85C),
                ),
                //circle point
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: CircleAvatar(
                    maxRadius: 20,
                    backgroundColor: Color(0xff1CA85C),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 32.82.h),
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/success.png",
                width: 200.0.w,
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
            child: Text("We have sent your invoice/payment request",
                style: blackLightTextStyle),
          ),
          Align(
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                text: 'to',
                style: blackLightTextStyle,
                children: const <TextSpan>[
                  TextSpan(
                      text: ' devin@coral.global',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Once your invoice is paid, the balance will",
              style: blackLightTextStyle,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "be added to your Honeydu wallet.",
              style: blackLightTextStyle,
            ),
          ),
        ],
      )),
    );
  }
}
