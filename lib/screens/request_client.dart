import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../constants.dart';
import 'complete.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: InkWell(
        child: Column(
          children: [
            SizedBox(
              height: 90.h,
            ),
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
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CircleAvatar(
                        maxRadius: 20,
                        backgroundColor: Color(0xff1CA85C),
                      ),
                    ),
                  ),
                  //progress bar
                  Container(
                    //width: 120.w,
                    width:
                        (MediaQuery.of(context).size.width - 90 - (10 * 3)) / 2,
                    height: 2.h,
                    color: Color(0xff1CA85C),
                  ),
                  //circle point
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Color(0xff1CA85C),
                    ),
                  ),
                  //progress bar
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 100 - (10 * 8)) /
                            2,
                    height: 2.h,
                    color: Color(0xff1CA85C),
                  ),
                  //circle point
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(60))),
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Color(0xffE4E4E4),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 71.h),
            InkWell(
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Request sent to client",
                      style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "\nYour client gets",
                          style: appBarTextStyle,
                        ),
                        TextSpan(
                            text: "\nPayment instructions",
                            style: lightBlackTextStyle,
                            children: [
                              TextSpan(text: "\nW-9 (tax) and vendor details"),
                              TextSpan(
                                  text:
                                      "\nAccess to online payment portal and"),
                              TextSpan(text: "\ninvoice management"),
                              TextSpan(text: "\n<3 from our team"),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: RequestClient(), type: PageTransitionType.fade));
              },
            )
          ],
        ),
        onTap: () {
          Navigator.push(context,
              PageTransition(child: Complete(), type: PageTransitionType.fade));
        },
      )),
    );
  }
}
