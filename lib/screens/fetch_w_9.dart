import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/screens/confirmation.dart';

import '../constants.dart';

class FetchW9 extends StatefulWidget {
  @override
  _FetchW9State createState() => _FetchW9State();
}

class _FetchW9State extends State<FetchW9> {
  @override
  void initState() {
    super.initState();

    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Confirmation()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
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
              SizedBox(
                width: 50.w,
              ),
              Text(
                "W-9 Review",
                style: headingTextStyle,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.directions_run_outlined),
              Text("Fetching W - 9 for reviews")
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
          CircularProgressIndicator(
            color: Colors.grey,
          )
        ],
      )),
    );
  }
}
