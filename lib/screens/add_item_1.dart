import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class AddItem1 extends StatefulWidget {
  @override
  _AddItem1State createState() => _AddItem1State();
}

class _AddItem1State extends State<AddItem1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.chevron_left,
                    size: 40.sp,
                  ),
                ),
                Text(
                  "ADD",
                  style: homeTextStyle1,
                )
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 34.w),
            child: TextFormField(
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
              keyboardType: TextInputType.text,
              cursorHeight: 50.h,
              cursorColor: Colors.black,
              showCursor: true,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff99ABA5), width: 0.2),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff99ABA5), width: 0.2),
                ),
                labelText: "Account Number",
                labelStyle: TextStyle(
                    height: 1,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff869B94)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
