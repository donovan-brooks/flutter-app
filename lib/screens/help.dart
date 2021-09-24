import 'package:Honeydu/screens/contact_via_text_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class Help extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Help",
          style: headingTextStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left),
            color: Colors.black,
            iconSize: 40.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 54.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 108.h),
              helpButtons(
                "Help Center",
                titleTextStyle,
                () {},
              ),
              helpButtons(
                "Contact us via text message",
                titleTextStyle,
                () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactViaText()));
                },
              ),
              helpButtons(
                "Email us at help@honeydu.io",
                titleTextStyle,
                () {},
              ),
              helpButtons(
                "Security & Privacy",
                TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w300,
                  color: lightGreyColor,
                ),
                () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget helpButtons(
  String text,
  TextStyle textStyle,
  Function onPressed,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        child: Text(
          text,
          style: textStyle,
        ),
        onTap: onPressed,
      ),
      SizedBox(height: 35.h),
      Divider(
        height: 1.5,
        color: Color(0xffECECEC),
      ),
      SizedBox(height: 30.h),
    ],
  );
}
