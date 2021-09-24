import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/business_verification.dart';
import 'package:Honeydu/widgets/buttons.dart';

import '../constants.dart';

class CompleteProfile extends StatefulWidget {
  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          iconSize: 40.sp,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 60.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Complete your profile",
                    style: extraLargeBlackTextStyle,
                    children: [
                      TextSpan(
                        text: "\n\nTo make a withdrawal, you need to",
                        style: blackLightTextStyle,
                      ),
                      TextSpan(
                        text: "\ncomplete your profile.",
                        style: blackLightTextStyle,
                      )
                    ]),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        height: 2.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            tileMode: TileMode.clamp,
                            colors: [
                              Color(0xff1CA85C),
                              Color(0xff1CA85C),
                              Color(0xff1CA85C),
                              Colors.grey[300],
                              Colors.grey[300],
                              Colors.grey[300],
                            ],
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffE4E4E4),

                    // Make rounded corners
                    borderRadius: BorderRadius.circular(13)),
                height: 300.h,
                width: w * 0.80,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 30.h),
                  child: RichText(
                    text: TextSpan(
                        text: "Final step (2 min)",
                        style: darkGreyTextStyle,
                        children: [
                          TextSpan(
                              text: "\n\nFill out tax info for your W-9",
                              style: titleTextStyle.copyWith(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: "\n\nAdd vendor information ",
                                )
                              ]),
                          TextSpan(
                            text: "\n\nWill unlock",
                            style: darkGreyTextStyle,
                          ),
                          TextSpan(
                              text: "\n\nWithdrawals",
                              style: titleTextStyle.copyWith(
                                  fontSize: 18.sp, fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                  text: "\n\nW-9 for all clients",
                                ),
                                TextSpan(
                                  text: "\n\nVendor info for all clients",
                                ),
                              ]),
                        ]),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              CircularButtons(
                backgroundColor: Color(0xff1CA85C),
                borderColor: Colors.white,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusinessVerification(),
                  ),
                ),
                text: "Get Started",
                textColor: Colors.white,
                textStyle: buttonTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }
}
