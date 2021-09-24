import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_line/dotted_line.dart';
import '../constants.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 12.0.h, right: 18.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    child: Text(
                      "CONFIRM",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9D9D9D)),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "Confirm client agreement",
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          SizedBox(
            height: 30.h,
          ),
          IconButton(
            icon: Icon(
              Icons.check_circle,
              color: Colors.black,
            ),
            iconSize: 40.sp,
            onPressed: () {},
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "This request is for freelance work that ",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "my client has approved"),
                ]),
          ),
          SizedBox(
            height: 10.h,
          ),
          IconButton(
            icon: Icon(
              Icons.check_circle,
              color: Colors.black,
            ),
            iconSize: 40.sp,
            onPressed: () {},
          ),
          SizedBox(height: 10.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "My client is expecting a payment request",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w200,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "or an invoice"),
                ]),
          ),
          SizedBox(height: 70.h),
          DottedLine(
            dashColor: Color(0xff707070),
            dashGapLength: 7,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.penAlt),
                  color: Color(0xff819996),
                  iconSize: 30.sp,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.waveSquare),
                  color: Color(0xff819996),
                  iconSize: 30.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          DottedLine(
            dashColor: Color(0xff707070),
            dashGapLength: 7,
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Clear",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff74C7A5)),
                ),
              )),
          SizedBox(
            height: 83.h,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Important",
                style: greySmallTextStyle,
                children: [
                  TextSpan(
                    text:
                        "\n\nKnowingly sending a request to a business you have not \ndone work for or where there is no agreement regarding",
                  ),
                  TextSpan(
                    text: "\npayment might open you up for legal action",
                  ),
                ]),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 50.h,
          )
        ],
      )),
    );
  }
}
