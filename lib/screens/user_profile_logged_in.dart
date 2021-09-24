import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/your_own_profile.dart';

import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class UserProfileLoggedIn extends StatefulWidget {
  @override
  _UserProfileLoggedInState createState() => _UserProfileLoggedInState();
}

class _UserProfileLoggedInState extends State<UserProfileLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          //the top close button
          Padding(
            padding: EdgeInsets.only(top: 16.h, right: 30.w),
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
          //the naming avatar is used from the your own profile screen to display the name
          Padding(
            padding: EdgeInsets.only(top: 57.h),
            // child: namingAvatar(),
          ),
          SizedBox(
            height: 32.h,
          ),
          TextWidget(
            text: "Coral Lab",
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 32.sp,
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
            height: 20.h,
          ),
          //buttons are used in row
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
            height: 50.h,
          ),
          //emojis are used in these widgets and they are clickale text
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(
                      "🤝",
                      style: TextStyle(fontSize: 24.sp),
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
                      "🛌",
                      style: TextStyle(fontSize: 24.sp),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "In your contacts",
                      style: lightBlackTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          divider(),
          //listview is being used to display all the record  in the form of listtiles
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 26.w, top: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activity",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  divider(),
                  //listview is being used to display the data on the screen
                  // Expanded(
                  //   child: ListView(
                  //     physics: BouncingScrollPhysics(),
                  //     children: [
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 15.h, bottom: 15.h, left: 10.w),
                  //         child: listViewTiles(
                  //           context,
                  //           Invoice(

                  //           ),
                  //           width: width,
                  //         ),
                  //       ),
                  //       divider(),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 15.h, bottom: 15.h, left: 10.w),
                  //         child: listViewTiles(
                  //           context,
                  //           width: width,
                  //           text: "Digital Currency",
                  //           isCompleted: true,
                  //           nameAvatar: CircleAvatar(
                  //             radius: 25.sp,
                  //             backgroundColor: Color(0xffEAEAEA),
                  //             child: Text(
                  //               "D",
                  //               style: avatarTextStyle,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       divider(),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 15.h, bottom: 15.h, left: 10.w),
                  //         child: listViewTiles1(
                  //           context,
                  //           width: width,
                  //           text: "Mason View Inc",
                  //           isRequested: true,
                  //           nameAvatar: CircleAvatar(
                  //             radius: 25.sp,
                  //             backgroundColor: Color(0xffEAEAEA),
                  //             child: Text(
                  //               "M",
                  //               style: avatarTextStyle,
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       divider(),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 15.h, bottom: 15.h, left: 10.w),
                  //         child: listViewTiles1(
                  //           context,
                  //           width: width,
                  //           text: "Nomadic co",
                  //           nameAvatar: CircleAvatar(
                  //             radius: 25.sp,
                  //             backgroundColor: Color(0xffEAEAEA),
                  //             child: Text(
                  //               "N",
                  //               style: avatarTextStyle,
                  //             ),
                  //           ),
                  //           isRequested: false,
                  //         ),
                  //       ),
                  //       divider(),
                  //       Padding(
                  //         padding: EdgeInsets.only(
                  //             top: 15.h, bottom: 15.h, left: 10.w),
                  //         child: listViewTiles(
                  //           context,
                  //           width: width,
                  //           text: "Coral Lab",
                  //           nameAvatar: CircleAvatar(
                  //             radius: 25.sp,
                  //             backgroundColor: Color(0xffEAEAEA),
                  //             child: Text(
                  //               "C",
                  //               style: avatarTextStyle,
                  //             ),
                  //           ),
                  //           isCompleted: true,
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 70.h,
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}

//buttons used are inherited from this class
class UserProfileButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final TextStyle textStyle;
  const UserProfileButton(
      {Key key,
      this.text,
      this.textStyle,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .40,
      height: 70.h,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(31.0),
                    side: BorderSide(color: borderColor))),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(textColor),
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 23.h)),
            textStyle: MaterialStateProperty.all(textStyle)),
        child: Text(text),
      ),
    );
  }
}
