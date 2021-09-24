import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class PaymentInfo extends StatefulWidget {
  @override
  _PaymentInfoState createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 16.h, left: 22.w),
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
          CircleAvatar(
            maxRadius: 50,
            backgroundColor: Colors.grey,
            child: Text(
              'C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          RichText(
            text: TextSpan(
              text: "\$50",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: ".00",
                  style: TextStyle(
                    color: Color(0xff93A19B),
                    fontSize: 25.sp,
                  ),
                ),
                TextSpan(
                  text: "\n\nJuly 20, 2021",
                  style: appBarTextStyle,
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50.h,
          ),
          Container(
            height: h,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35))),
            child: Column(
              children: [
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: CircleAvatar(
                            maxRadius: 20,
                            backgroundColor: Color(0xff1CA85C),
                          ),
                        ),
                      ),
                      //progress bar
                      Container(
                        //width: 120.w,
                        width: (MediaQuery.of(context).size.width -
                                90 -
                                (10 * 3)) /
                            2,
                        height: 5.h,
                        color: Color(0xff1CA85C),
                      ),
                      //circle point
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: CircleAvatar(
                          maxRadius: 20,
                          backgroundColor: Color(0xff1CA85C),
                        ),
                      ),
                      //progress bar
                      Container(
                        width: (MediaQuery.of(context).size.width -
                                100 -
                                (10 * 8)) /
                            2,
                        height: 5.h,
                        color: Color(0xff1CA85C),
                      ),
                      //circle point
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(60))),
                        child: CircleAvatar(
                          maxRadius: 19,
                          backgroundColor: Color(0xff1CA85C),
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Request sent",
                        style: greySmallTextStyle,
                      ),
                      Text(
                        "Client viewed",
                        style: greySmallTextStyle,
                      ),
                      Text(
                        "Client Paid",
                        style: greySmallTextStyle,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "This payment request is complete",
                  style: greySmallTextStyle,
                ),
                SizedBox(
                  height: 47.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Sent to",
                            style: titleTextStyle,
                          ),
                          Text(
                            "jack@coral.global",
                            style: lightBlackTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    height: 153.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "You received",
                                style: titleTextStyle,
                              ),
                              Text(
                                "\$50",
                                style: lightBlackTextStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 50.w),
                                child: Text(
                                  "Fee (free)",
                                  style: titleTextStyle,
                                ),
                              ),
                              Text(
                                "\$0",
                                style: lightBlackTextStyle,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Total Requested",
                                style: titleTextStyle,
                              ),
                              Text(
                                "\$50",
                                style: lightBlackTextStyle,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 30.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Account Details",
                      style: appBarTextStyle,
                      //textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Insta post + story",
                            style: titleTextStyle,
                          ),
                          Text(
                            "\$50",
                            style: lightBlackTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 30.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Your personal message",
                      style: appBarTextStyle,
                      //textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                      height: 80.h,
                      width: w,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 20.h, left: 40.w, right: 20.w),
                        child: Text(
                          "Thank you for your business.It has\nGreat working with you!",
                          style: titleTextStyle,
                        ),
                      )),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 30.w),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "For your records",
                      style: appBarTextStyle,
                      //textAlign: TextAlign.right,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                      height: 80.h,
                      width: w,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 40.w, top: 30.h),
                        child: Text(
                          "Client invoice PDF",
                          style: titleTextStyle,
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
