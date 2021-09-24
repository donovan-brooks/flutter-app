import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/complete-profile.dart';
import 'package:Honeydu/screens/Login-signup/login.dart';
import 'package:Honeydu/screens/edit_profile.dart';
import 'package:Honeydu/screens/user_profile.dart';
import 'package:Honeydu/services/business_verification_services.dart';
import 'package:Honeydu/services/logout.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';
import 'package:Honeydu/widgets/buttons.dart';
import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class YourOwnProfile extends StatefulWidget {
  @override
  _YourOwnProfileState createState() => _YourOwnProfileState();
}

class _YourOwnProfileState extends State<YourOwnProfile> {
  bool ifRegisterd;
  List<String> personalData;
  @override
  void initState() {
    _loadData();
    checkRegistrystatus();
    super.initState();
  }

  _loadData() async {
    List<String> data = await loadPersonalData();
    setState(() {
      personalData = data;
    });
  }

  void checkRegistrystatus() async {
    bool checkStatus = await businessVerificationServices();
    setState(() {
      ifRegisterd = checkStatus;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
          ),
          iconSize: 40.sp,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 30.w,
                top: 20.h,
              ),
              child: ListTile(
                leading:
                    namingAvatar(personalData != null ? personalData[2] : "C"),
                title: InkWell(
                  child: Text(
                    personalData != null ? personalData[2] : "Waiting ...",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfile(
                        data: personalData,
                      ),
                    ),
                  ),
                ),
                subtitle: InkWell(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditProfile(profileData: personalData),
                    ),
                  ).whenComplete(() => setState(() => _loadData())),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.link,
                    color: Colors.black,
                    size: 25.sp,
                  ),
                  iconSize: 40.sp,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            SizedBox(height: 52.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: CircularButtons(
                backgroundColor: Colors.black,
                borderColor: Colors.black,
                onPressed: () {},
                text: "Invite friends, Get \u00245",
                textColor: Colors.white,
                textStyle: buttonTextStyleNormal,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 60.w, top: 43.7),
              child: Row(
                children: [
                  Text(
                    "🥳",
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Joined in 2021",
                    style: lightBlackTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            divider(),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 54.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ifRegisterd != null
                      ? !ifRegisterd
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get Started",
                                  style: appBarTextStyle,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                InkWell(
                                  child: Text(
                                    "Finish setting up Honeydu",
                                    style: titleTextStyle,
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
                                divider(),
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
                                    style: titleTextStyle,
                                  ),
                                  onTap: () {},
                                ),
                              ],
                            )
                          : Container(
                              width: 0,
                              height: 0,
                            )
                      : Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: LinearProgressIndicator(
                                  backgroundColor: Colors.grey[300],
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.grey[350]),
                                ),
                              ),
                            ),
                          ],
                        ),
                  Text(
                    "Business Documents",
                    style: appBarTextStyle,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    child: Text(
                      "W-9 form",
                      style: titleTextStyle,
                    ),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  divider(),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    "Tax season",
                    style: appBarTextStyle,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    child: Text(
                      "Account Statements",
                      style: titleTextStyle,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            InkWell(
              child: TextWidget(
                text: "Log out",
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1CA85C),
              ),
              onTap: () async {
                logoutService();
                bool isLoggedOut = await deleteSharedPreference();
                isLoggedOut
                    ? Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                        (route) => false)
                    : showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "Something went wrong",
                            style: kErrorMessage,
                          ),
                        ),
                      );
              },
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      )),
    );
  }
}

Widget namingAvatar(String name) {
  return CircleAvatar(
    radius: 30.sp,
    backgroundColor: Color(0xff1CA85C),
    child: Text(
      name != null ? name[0] : "C",
      style: TextStyle(
          color: Colors.white,
          fontSize: 26.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Airbnb Cereal App"),
    ),
  );
}

Widget divider() {
  return Divider(
    color: Color(0xffECECEC),
    height: 4,
    indent: 20,
  );
}
