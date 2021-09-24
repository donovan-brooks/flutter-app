import 'package:flutter/material.dart';
import 'package:Honeydu/screens/request_client.dart';
import 'package:page_transition/page_transition.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';

class ReviewComplete extends StatelessWidget {
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
                          (MediaQuery.of(context).size.width - 90 - (10 * 3)) /
                              2,
                      height: 2.h,
                      color: Color(0xff1CA85C)),

                  //circle point
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Color(0xffE4E4E4),
                    ),
                  ),
                  //ptogress bar
                  Container(
                    width:
                        (MediaQuery.of(context).size.width - 100 - (10 * 8)) /
                            2,
                    height: 2.h,
                    color: Color(0xffE4E4E4),
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
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Review complete",
                      style: TextStyle(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 37.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "We’ll take it from here",
                      style: lightBlackTextStyle,
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
          Navigator.push(
              context,
              PageTransition(
                  child: RequestClient(), type: PageTransitionType.fade));
        },
      )),
    );
  }
}
