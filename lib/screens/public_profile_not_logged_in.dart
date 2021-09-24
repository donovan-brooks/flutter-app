import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/screens/user_profile.dart';
import 'package:Honeydu/screens/your_own_profile.dart';

import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class PublicProfileNotLoggedIn extends StatefulWidget {
  @override
  _PublicProfileNotLoggedInState createState() =>
      _PublicProfileNotLoggedInState();
}

class _PublicProfileNotLoggedInState extends State<PublicProfileNotLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          //the buttons are used in row with space evenly between them
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconData(
                  icondata: Icon(
                    Icons.chevron_left,
                    size: 40.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                ),
                IconData(
                  icondata: Icon(
                    Icons.qr_code,
                    size: 60.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),

          // namingAvatar(),
          SizedBox(
            height: 32.h,
          ),
          TextWidget(
            text: "Coral Lab",
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.link,
                  color: Colors.black,
                ),
                iconSize: 30.sp,
                onPressed: () => Navigator.pop(context),
              ),
              TextWidget(
                text: "devin-picciolini",
                color: Color(0xffB3BEBA),
                fontWeight: FontWeight.w200,
                fontSize: 16.sp,
              )
            ],
          ),
          SizedBox(
            height: 44.h,
          ),
          //social media links buttons being used here
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconData(
                  icondata: Icon(
                    FontAwesomeIcons.instagram,
                    size: 40.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                ),
                IconData(
                  icondata: Icon(
                    FontAwesomeIcons.youtube,
                    size: 40.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                ),
                IconData(
                  icondata: Icon(
                    FontAwesomeIcons.tiktok,
                    size: 40.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                ),
                IconData(
                  icondata: Icon(
                    FontAwesomeIcons.paypal,
                    size: 40.sp,
                    color: Colors.black,
                  ),
                  onpress: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          //buttons inherited from the class are used below
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UserProfileButton(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                onPressed: () {},
                text: "Request",
                textStyle: buttonTextStyleNormal,
                textColor: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              UserProfileButton(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                onPressed: () {},
                text: "Pay",
                textStyle: buttonTextStyleNormal,
                textColor: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          //emojis used and are clickable text used
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "🤝",
                      style: TextStyle(fontSize: 25.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: " Referred by",
                        style: TextStyle(
                          fontFamily: "Airbnb Cereal App",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: " Clay Digital",
                            style: TextStyle(
                              fontFamily: "Airbnb Cereal App",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 41.h,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "🔒",
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Member since 2021",
                      style: lightBlackTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          divider(),
          SizedBox(height: 150.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "POWERED BY",
                style: TextStyle(
                    color: Color(0xff9D9D9D),
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400),
              ),
              Image.asset(
                "assets/images/logo.jpeg",
              ),
            ],
          )
        ],
      )),
    );
  }
}

//icon made so the icon widget will be inherie=ted from here
class IconData extends StatelessWidget {
  final Function onpress;
  final Icon icondata;

  const IconData({
    Key key,
    this.onpress,
    this.icondata,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icondata,
      onPressed: () => onpress,
    );
  }
}
