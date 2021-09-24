import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/textfield.dart';

import '../constants.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 50.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.chevron_left),
                color: Colors.black,
                iconSize: 40.sp,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 60.0.sp,
                      child: Text(
                        'C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Devin Picciolini",
                          style: titleTextStyle,
                        ),
                        SizedBox(height: 9.h),
                        Padding(
                          padding: EdgeInsets.only(right: 30.0.w),
                          child: InkWell(
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w200,
                                color: Colors.black,
                              ),
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              TextfieldWidget(
                //hintText: "Finish setting up Honeydu",
                titleText: "Getting Started",
              ),
              Textfield3(
                hintText: "Chase bank ****0328",
                titleText: "Banking details",
              ),
              SizedBox(
                height: 25.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "W-9 form",
                  style: appBarTextStyle,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Vendor form",
                  style: appBarTextStyle,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              TextfieldWidget(
                //hintText: "Account Statements",
                titleText: "Tax season",
              ),
              TextfieldWidget(
                //hintText: "Sync your Quickbooks",
                titleText: "Sync your Quickbooks",
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}
