import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/addBankDetails/add_bank_manually.dart';
import 'package:Honeydu/screens/complete-profile.dart';
import 'package:Honeydu/screens/edit_profile.dart';
import 'package:Honeydu/widgets/textfield.dart';

import '../constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          iconSize: 40.sp,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(left: 50.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.chevron_left),
                color: Colors.black,
                iconSize: 40.sp,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      maxRadius: 60.0.sp,
                      child: Text(
                        'C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 28.w),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Devin Picciolini",
                          style: titleTextStyle,
                        ),
                        SizedBox(height: 9.h),
                        Padding(
                          padding: EdgeInsets.only(right: 30.0.w),
                          child: InkWell(
                            child: Text("Edit Profile",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w200,
                                    color: Colors.black)),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfile(),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 45.h,
              ),
              Text(
                "Getting Started",
                style: appBarTextStyle,
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                child: Text(
                  "Finish setting up Honeydu",
                  style: headingTextStyle,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CompleteProfile(),
                  ),
                ),
              ),
              SizedBox(
                height: 35.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                "Banking details",
                style: appBarTextStyle,
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                  child: Text(
                    "Link a bank account or card",
                    style: headingTextStyle,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext contxt) => Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.transparent,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 12,
                                      blurRadius: 12,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              height: 260.h,
                              child: Padding(
                                padding: EdgeInsets.only(left: 40.w, top: 40.h),
                                child: ListView(
                                  children: <Widget>[
                                    InkWell(
                                      child: Text(
                                        "Enter banking details ",
                                        style: headingTextStyle,
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddBankDetailsPage(),
                                            fullscreenDialog: true),
                                      ),
                                    ),
                                    SizedBox(height: 50.h),
                                    InkWell(
                                      child: Text(
                                        "Verify bank instantly",
                                        style: headingTextStyle,
                                      ),
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CompleteProfile(),
                                        ),
                                      ),
                                      hoverColor: Colors.grey,
                                    ),
                                  ],
                                ),
                              ),
                            )));
                  }),
              SizedBox(
                height: 35.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              SizedBox(
                height: 26.h,
              ),
              Text(
                "Business Information",
                style: appBarTextStyle,
              ),
              SizedBox(
                height: 30.h,
              ),
              InkWell(
                child: Text(
                  "Add business details",
                  style: headingTextStyle,
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 35.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "W-9 form",
                  style: appBarTextStyle,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              SizedBox(
                height: 26.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Vendor form",
                  style: appBarTextStyle,
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              Divider(
                height: 1.5,
                color: Color(0xffECECEC),
              ),
              TextfieldWidget(
                //hintText: "Account Statements",
                titleText: "Tax season",
              ),
              TextfieldWidget(
                //hintText: "Sync your Quickbooks",
                titleText: "Accounting",
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      )),
    );
  }
}

Widget getInfo(String name, String subtitle, Function onPressed) {
  return Column(
    children: [
      Text(
        name,
        style: headingTextStyle,
      ),
      SizedBox(
        height: 30.h,
      ),
      InkWell(
        child: Text(
          subtitle,
          style: appBarTextStyle,
        ),
        onTap: onPressed,
      ),
      SizedBox(
        height: 35.h,
      ),
      Divider(
        height: 1.5,
        color: Color(0xffECECEC),
      ),
      SizedBox(
        height: 26.h,
      ),
    ],
  );
}
