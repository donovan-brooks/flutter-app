import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:Honeydu/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/services/get_invoice_services.dart';
import 'package:Honeydu/widgets/buttons.dart';
import 'package:Honeydu/widgets/list_tile_widget.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff139990),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 34.w, top: 28.h),
                child: AutoSizeText(
                  "Insights",
                  style: homeTextStyle,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 28.0.w, top: 30.h, bottom: 28.h),
                child: InkWell(
                  child: Icon(
                    FontAwesomeIcons.gift,
                    color: Colors.white,
                    size: 50,
                  ),
                  onTap: () => showDialogBox(context, width, height),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 34.5.h,
          ),
          Container(
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 36.0.w, top: 33.5.h),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        maxRadius: 40.0.sp,
                        child: Text(
                          'C',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      //SizedBox(width: 170.w),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.help_outline),
                        color: Colors.black,
                        iconSize: 40.sp,
                      ),
                      // SizedBox(
                      //   width: 15.w,
                      // ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings_outlined),
                        color: Colors.black,
                        iconSize: 40.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 12,
                          blurRadius: 12,
                          offset: Offset(0, 2),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  height: 250.h,
                  width: width * 0.90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 21.h, right: 17.w),
                        child: Container(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            "assets/images/logo_icon.png",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 70.2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Honeydu balance",
                              style: homeTextStyle1,
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0.w),
                        child: RichText(
                          text: TextSpan(
                            text: '\u002450.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 38.sp,
                                fontWeight: FontWeight.w600),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: '00',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 20)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32.60.h),
                Divider(
                  indent: 30,
                  height: 1.5,
                  color: Color(0xffECECEC),
                ),
                SizedBox(
                  height: 28.31.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.control_point_outlined),
                        color: Color(0xff1CA85C),
                        iconSize: 40.sp,
                      ),
                      SizedBox(
                        width: 21.w,
                      ),
                      AutoSizeText(
                        "Request Money",
                        style: titleTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.60.h),
                Divider(
                  indent: 30,
                  height: 1.5,
                  color: Color(0xffECECEC),
                ),
                SizedBox(
                  height: 28.31.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.control_point_outlined),
                        color: Color(0xff1CA85C),
                        iconSize: 40.sp,
                      ),
                      SizedBox(
                        width: 21.w,
                      ),
                      AutoSizeText(
                        "Withdraw",
                        style: titleTextStyle,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.31.h,
                ),
                Divider(
                  indent: 30,
                  height: 1.5,
                  color: Color(0xffECECEC),
                ),
                SizedBox(
                  height: 35.5.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.w),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Activity",
                      style: headingTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Divider(
                  indent: 30,
                  height: 1.5,
                  color: Color(0xffECECEC),
                ),
                SizedBox(
                  height: 21.h,
                ),
                Expanded(
                  child: FutureBuilder(
                    future: getInvoices(),
                    builder: (_, AsyncSnapshot<InvoiceList> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData &&
                          snapshot != null) {
                        InvoiceList data = snapshot.data;
                        return ListView.builder(
                          itemCount: data.invoiceList.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => listViewTiles(
                            context,
                            data.invoiceList.elementAt(index),
                            width: width,
                          ),
                        );
                      } else
                        return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

showDialogBox(BuildContext buildContext, double width, double height) {
  return showDialog(
    context: buildContext,
    builder: (ctx) => Container(
      height: height,
      width: width,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            color: Colors.black.withOpacity(0.6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 200.h),
                  Icon(
                    FontAwesomeIcons.gift,
                    color: Colors.white,
                    size: 120,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "You have a \u002450 bonus\n      waiting for you!",
                    style: whiteLargeTextStyle,
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Divider(
                    endIndent: 20,
                    indent: 20,
                    height: 1.5,
                    color: Color(0xffECECEC),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  homeBlurScreenText(
                    0,
                    "Sign up for Honeydu",
                  ),
                  homeBlurScreenText(
                    10.h,
                    "Send your first request to a client",
                  ),
                  homeBlurScreenText(
                    10.h,
                    "Claim your \u00245050 bonus",
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: CircularButtons(
                      backgroundColor: Colors.black.withOpacity(0.1),
                      borderColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(buildContext);
                      },
                      text: "Ok",
                      textColor: Colors.white,
                      textStyle: whiteSmallTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget homeBlurScreenText(
  double sizedBoxHeight,
  String text,
) {
  return Column(children: [
    SizedBox(
      height: sizedBoxHeight,
    ),
    Row(
      children: <Widget>[
        Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 30.sp,
        ),
        SizedBox(
          width: 15.w,
        ),
        Text(
          text,
          style: whiteSmallTextStyle,
        )
      ],
    ),
  ]);
}
