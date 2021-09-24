import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/screens/request_invoice/preview.dart';
import 'package:Honeydu/screens/review_request.dart';

import '../constants.dart';

class Confirmation extends StatefulWidget {
  @override
  _ConfirmationState createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  RelativeRect buttonMenuPosition(BuildContext context) {
    final RenderBox bar = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    const Offset offset = Offset.zero;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
        bar.localToGlobal(bar.size.centerRight(offset), ancestor: overlay),
      ),
      offset & overlay.size,
    );
    return position;
  }

  showMenus2(BuildContext context) {
    showMenu(
      elevation: 15,
      context: context,
      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width * 0.12,
          90, MediaQuery.of(context).size.width * 0.12, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      items: [
        PopupMenuItem(
          child: Row(
            children: [
              Icon(Icons.schedule_outlined),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Set Recurring",
                style: blackLightTextStyle,
              )
            ],
          ),
        ),
        PopupMenuItem(
          height: 75.h,
          child: Row(
            children: [
              Icon(Icons.receipt),
              SizedBox(
                width: 10.w,
              ),
              Text(
                "Change Invoice #",
                style: blackLightTextStyle,
              ),
              Spacer(),
              Text(
                "0224",
                style: TextStyle(color: Color(0xffABABAB)),
              )
            ],
          ),
        ),
      ],
    );
  }

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
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: IconButton(
                      icon: Icon(
                        Icons.settings_outlined,
                        color: Color(0xff707070),
                      ),
                      iconSize: 33.sp,
                      onPressed: () {
                        showMenus2(context);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12.0.h, right: 18.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      child: Text(
                        "SEND",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff9D9D9D)),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewRequest(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 52.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Container(
                height: 440.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff707070).withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.w, vertical: 25.h),
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff707070),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 22.0.w),
                              child: Icon(
                                FontAwesomeIcons.userAstronaut,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              "jack@coral.global",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "\u00241.00",
                        style: TextStyle(
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        //textAlign: TextAlign.right,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_rounded,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                        Text("Add another amount", style: blackLightTextStyle)
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Divider(
                      color: Colors.black,
                      endIndent: 25,
                      indent: 25,
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0.w),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text("Personal", style: appBarTextStyle
                            //textAlign: TextAlign.right,
                            ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 8.h,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 36.0.w),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Thank you for your business…",
                                style: blackLightTextStyle),
                          ),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 15.h, right: 20.w),
                            child: Icon(
                              FontAwesomeIcons.edit,
                              color: Colors.black,
                              size: 20.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Container(
                height: 62.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff707070).withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 170.w),
                        child: Text(
                          "Net 30",
                          style: blackLightTextStyle,
                        ),
                      ),
                      Icon(
                        FontAwesomeIcons.caretDown,
                        color: Colors.black,
                        size: 20.sp,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 61.w, right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Due date",
                    style: blackLightTextStyle,
                  ),
                  Text(
                    "8/28/2021",
                    style: blackLightTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 61.w, right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total requested",
                    style: blackLightTextStyle,
                  ),
                  Text(
                    "\u00241.00",
                    style: blackLightTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 61.w, right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Fee (fee)",
                    style: blackLightTextStyle,
                  ),
                  Text(
                    "\u00240",
                    style: blackLightTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 61.w, right: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "You'll get",
                    style: blackLightTextStyle,
                  ),
                  Text(
                    "\u00241.00",
                    style: blackLightTextStyle,
                  )
                ],
              ),
            ),
            SizedBox(height: 43.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 87.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .70,
                height: 85.h,
                child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Preview())),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(34.0),
                              side: BorderSide(color: Color(0xff707070)))),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 23.h)),
                      textStyle:
                          MaterialStateProperty.all(blackLightTextStyle)),
                  child: Text("Preview Invoice"),
                ),
              ),
            ),
            SizedBox(height: 100.h)
          ],
        ),
      ),
    );
  }
}
