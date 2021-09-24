import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/widgets/buttons.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/send_invoice_request_status.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../constants.dart';

class PublicPayPageWithBank extends StatefulWidget {
  @override
  _PublicPayPageWithBankState createState() => _PublicPayPageWithBankState();
}

class _PublicPayPageWithBankState extends State<PublicPayPageWithBank> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFBFBFB),
        actions: [
          IconButton(
            onPressed: () {
              //bottom sheet that will pop up the menu from the bottom
              showMaterialModalBottomSheet(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(41))),
                bounce: true,
                context: context,
                builder: (context) => Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white, //color of shadow
                        spreadRadius: 1, //spread radius
                        blurRadius: 2, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Expanded(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30.h,
                      ),
                      CircularButtons(
                        backgroundColor: Color(0xffE4E5EA).withOpacity(0.4),
                        borderColor: Color(0xffE4E5EA).withOpacity(0.2),
                        onPressed: () {},
                        text: "Preview invoice PDF",
                        textColor: Colors.black,
                        textStyle: blackLightTextStyle,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CircularButtons(
                        backgroundColor: Colors.white,
                        borderColor: Color(0xffFF0808).withOpacity(0.3),
                        onPressed: () {},
                        text: "Reject",
                        textColor: Color(0xffFF0808),
                        textStyle: blackLightTextStyle,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      InkWell(
                          child: Text(
                            "Close",
                            style: TextStyle(
                                color: Color(0xff1CA85C),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          })
                    ],
                  )),
                ),
              );
            },
            color: Colors.grey,
            icon: Icon(Icons.more_horiz),
          )
        ],
      ),
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(child: logo(() {})),
          SizedBox(
            height: 40.h,
          ),
          //EMAIL CONTAINER WHERE THE EMAIL WILL BE DISPALYED WITH ROBOT SIGN
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            width: width * 0.50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    FontAwesomeIcons.userAstronaut,
                    size: 18,
                  ),
                  Flexible(
                    child: Text(
                      "jack@coral.global",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            "requests",
            style: appBarTextStyle,
          ),
          //the amount will be displayed here
          Padding(
            padding: EdgeInsets.only(top: 60.h, bottom: 30.h),
            child: Text(
              "\$2500",
              style: TextStyle(
                color: Colors.black,
                fontSize: 70.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //button to move to the screen
          InkWell(
            child: Text("Details", style: inkwellTextStyle),
            onTap: () {
              showMaterialModalBottomSheet(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(41))),
                bounce: true,
                context: context,
                builder: (context) => Container(
                  height: 550.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(41),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white, //color of shadow
                        spreadRadius: 1, //spread radius
                        blurRadius: 2, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40.h,
                        ),
                        Text("Details",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        Expanded(
                          flex: 2,
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  children: <Widget>[
                                    modelBottomSheetItemRow(
                                        "Insta post", "QTY1"),
                                    modelBottomSheetItemRow(
                                        "Insta content writting", "Qty 3")
                                  ],
                                ),
                              )),
                        ),
                        Container(
                            height: 60.h,
                            margin: EdgeInsets.symmetric(vertical: 5.h),
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: modelBottomSheetItemRow(
                                "Due date", "8/28/2021")),
                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                modelBottomSheetItemRow(
                                    "Total requested", "\u00242500"),
                                modelBottomSheetItemRow(
                                    "Fee (free)", "\u00240"),
                                modelBottomSheetItemRow(
                                    "You'll pay", "\u00242500"),
                              ],
                            ),
                          ),
                        ),
                        CircularButtons(
                          backgroundColor: Color(0xffE4E5EA),
                          borderColor: Color(0xffE4E5EA).withOpacity(0.2),
                          onPressed: () {},
                          text: "Preview invoice PDF",
                          textColor: Colors.black,
                          textStyle: blackLightTextStyle,
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        InkWell(
                            child: Text(
                              "Close",
                              style: TextStyle(
                                  color: Color(0xff1CA85C),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              bottom: 30.h,
            ),
            child: Container(
              width: width * 0.80,
              height: 70.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Due Date",
                      style: blackLightTextStyle,
                    ),
                    Text(
                      "8/28/2021",
                      style: blackLightTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Text("Thank you for your business!"),

          Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              bottom: 30.h,
            ),
            child: Container(
              width: width * 0.80,
              height: 70.h,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5).withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Charles Schwab ",
                      style: extraSmallBlackTextStyle,
                    ),
                    Text(
                      "****7729",
                      style: extraSmallBlackTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButtonContainer(
            label: Text("Pay now"),
            onPress: () {},
            containerPadding: EdgeInsets.only(bottom: 20),
            verticalPadding: 20,
            circularBorder: 50,
            width: width * 0.80,
          )
        ],
      )),
    );
  }
}

Widget logo(Function onTap) {
  return InkWell(
    child: Image.asset(
      "assets/images/logo.jpeg",
    ),
    onTap: onTap,
  );
}
