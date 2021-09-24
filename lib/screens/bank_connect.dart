import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/screens/your_own_profile.dart';
import 'package:Honeydu/widgets/buttons.dart';

import '../constants.dart';

class BankConnect extends StatefulWidget {
  @override
  _BankConnectState createState() => _BankConnectState();
}

class _BankConnectState extends State<BankConnect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.h, right: 22.w),
                child: Align(
                  alignment: Alignment.topRight,
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
              Image.asset(
                "assets/images/bank_connect.png",
              ),
              SizedBox(
                height: 30.h,
              ),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "WonderWallet uses",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Plaid",
                        style: TextStyle(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: "\nto connect your applications",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w200),
                      ),
                    ],
                  )),
              SizedBox(
                height: 30.h,
              ),
              detailsText(
                  "Connect effortlessly",
                  "Plaids lets you securely connect \n your finicial accounts in seconds ",
                  30.h,
                  FontAwesomeIcons.plug,
                  65.w),
              detailsText(
                  "Your data belongs to you",
                  "This application will never be able to \n access your credientals",
                  120.h,
                  Icons.visibility_off,
                  65.w),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By selecting "continue" you agree to the',
                  style: lightBlackTextStyle,
                  children: [
                    TextSpan(
                      text: '\nPaid End User Privacy Policy ',
                      style: headingTextStyle,
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog<void>(
                            context: context,
                            builder: (context) {
                              return Container();
                            },
                          );
                        },
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              SquareButtons(
                borderColor: Colors.white,
                backgroundColor: Colors.black,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YourOwnProfile())),
                text: "Continue",
                textColor: Colors.white,
                textStyle: headingTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget detailsText(String headingText, String detailText, double paddingBelow,
    IconData icon, double leftPadding) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            iconSize: 30.sp,
            onPressed: () {},
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            headingText,
            style: headingTextStyle,
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(left: leftPadding),
        child: Text(
          detailText,
          style: lightBlackTextStyle,
        ),
      ),
      SizedBox(
        height: paddingBelow,
      )
    ],
  );
}
