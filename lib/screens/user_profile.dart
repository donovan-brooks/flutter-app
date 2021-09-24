import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/screens/your_own_profile.dart';
import 'package:Honeydu/widgets/get_all_invoices.dart';

import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class UserProfile extends StatefulWidget {
  final List<String> data;

  const UserProfile({Key key, this.data}) : super(key: key);
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
            ),
            iconSize: 40.sp,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 35.sp),
              child: CircleAvatar(
                backgroundColor: appColor.primaryColor,
                maxRadius: 40.0.sp,
                minRadius: 30.0.sp,
                child: Text(
                  widget.data[2][0] ?? 'N',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            TextWidget(
              text: widget.data[2] + " " + widget.data[3],
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
                  text: widget.data[4],
                  color: Color(0xffB3BEBA),
                  fontWeight: FontWeight.w200,
                  fontSize: 16.sp,
                )
              ],
            ),
            //buttons are used in row
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  UserProfileButton(
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    onPressed: () {},
                    text: "Request",
                    textStyle: buttonTextStyleNormal,
                    textColor: Colors.white,
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
            ),
            // Padding(
            //   padding: EdgeInsets.only(left: 60.w),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Row(
            //         children: [
            //           Text(
            //             "🤝",
            //             style: TextStyle(fontSize: 24.sp),
            //           ),
            //           SizedBox(
            //             width: 8.w,
            //           ),
            //           RichText(
            //             textAlign: TextAlign.left,
            //             text: TextSpan(
            //               text: " Referred by",
            //               style: TextStyle(
            //                 fontFamily: "Airbnb Cereal App",
            //                 fontSize: 16.sp,
            //                 fontWeight: FontWeight.w200,
            //                 color: Colors.black,
            //               ),
            //               children: [
            //                 TextSpan(
            //                   text: " Clay Digital",
            //                   style: TextStyle(
            //                     fontFamily: "Airbnb Cereal App",
            //                     fontSize: 16.sp,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 41.h,
            //       ),
            //       Row(
            //         children: <Widget>[
            //           Text(
            //             "🛌",
            //             style: TextStyle(fontSize: 24.sp),
            //           ),
            //           SizedBox(
            //             width: 8.w,
            //           ),
            //           Text(
            //             "In your contacts",
            //             style: lightBlackTextStyle,
            //           ),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 20.h,
            // ),
            // divider(),
            //listview is being used to display all the record  in the form of listtiles

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 26.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: divider(),
                    ),
                    Text(
                      "Activity",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: divider(),
                    ),
                    GetAllInvoices(
                      width: MediaQuery.of(context).size.width,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
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
      height: 60.h,
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
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10.h)),
            textStyle: MaterialStateProperty.all(textStyle)),
        child: Text(text),
      ),
    );
  }
}
