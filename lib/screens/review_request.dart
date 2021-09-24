import 'package:flutter/material.dart';
import 'package:Honeydu/screens/review_complete.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class ReviewRequest extends StatelessWidget {
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
                        backgroundColor: Color(0xffFEB82C),
                      ),
                    ),
                  ),
                  //progress bar
                  Container(
                    //width: 120.w,
                    width:
                        (MediaQuery.of(context).size.width - 90 - (10 * 3)) / 2,
                    height: 2.h,
                    color: Color(0xffFEB82C),
                  ),
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
                  //progress bar
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
              child: Column(children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Reviewing Request",
                    style: TextStyle(
                        fontSize: 32.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 130.h,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 180.h,
                      width: 330.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 2, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                          //you can set more BoxShadow() here
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: 80.h),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Total requesting",
                            style: loginSmsTextStyle,
                            children: [
                              TextSpan(
                                text: "\n\u002420",
                                style: extraLargeBlackTextStyle,
                              ),
                              TextSpan(
                                text: ".50",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 55.w),
                      child: Container(
                          height: 60.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff98A5B3)
                                    .withOpacity(0.3), //color of shadow
                                spreadRadius: 1, //spread radius
                                blurRadius: 1, // blur radius
                                offset:
                                    Offset(0, 2), // changes position of shadow
                                //first paramerter of offset is left-right
                                //second parameter is top to down
                              ),
                              //you can set more BoxShadow() here
                            ],

                            // border: Border.all(
                            //   color: Color(0xff707070),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15.w,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                maxRadius: 20.sp,
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Center(
                                child: Text(
                                  "jack@coral.global",
                                  style: titleTextStyle,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ]),
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: ReviewComplete(),
                        type: PageTransitionType.fade));
              },
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: ReviewComplete(), type: PageTransitionType.fade));
        },
      )),
    );
  }
}
