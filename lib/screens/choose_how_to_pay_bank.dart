import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/public_pay_page_with_bank.dart';

import 'package:Honeydu/widgets/elevated_button_container.dart';

class ChooseHowToPayBank extends StatefulWidget {
  @override
  _ChooseHowToPayBankState createState() => _ChooseHowToPayBankState();
}

class _ChooseHowToPayBankState extends State<ChooseHowToPayBank> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffFBFBFB),
          leading: IconButton(
            onPressed: () {},
            color: Colors.black,
            iconSize: 30.sp,
            icon: Icon(Icons.chevron_left),
          )),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //clicakble logo at the top
          Center(
            child: logo(() {}),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.w, top: 60.h, bottom: 40.h),
            child: Text("Choose how you\nwant to pay",
                style: TextStyle(
                  fontSize: 29.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                )),
          ),
          //clickable widgets used that help the user to select any of the options
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: <Widget>[
                //widget inherited from elevated button container file and HowTopay container class in widget folder
                HowToPayContainer(
                  title: "Manually",
                  onTap: () {},
                  subtitle: "Use your account and routing\nnumber to verify.",
                ),
                SizedBox(
                  height: 15.h,
                ),
                //widget inherited from elevated button container file and HowTopay container class in widget folder
                HowToPayContainer(
                  title: "Verify Instantly",
                  onTap: () {},
                  subtitle:
                      "Login via Plaid and connect\nyour bank in seconds.",
                ),
                Spacer(),
                //button
                ElevatedButtonContainer(
                  label: Text("Next"),
                  onPress: () {},
                  containerPadding: EdgeInsets.only(bottom: 20),
                  verticalPadding: 20,
                  circularBorder: 50,
                  width: width * 0.80,
                ),
              ],
            ),
          ))
        ],
      )),
    );
  }
}
