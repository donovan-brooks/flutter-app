import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/buttons.dart';

class WithdrawSuccess extends StatefulWidget {
  final String amount;

  const WithdrawSuccess({Key key, this.amount}) : super(key: key);
  @override
  _WithdrawSuccessState createState() => _WithdrawSuccessState();
}

class _WithdrawSuccessState extends State<WithdrawSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(right: 40.w, top: 30.h),
              child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Color(0xff707070),
                  ),
                  iconSize: 40.sp,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 49.w),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Success your money\nis on the way.",
                style: TextStyle(
                    fontSize: 33.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/card.png",
              //width: 180.0.w,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Meet the Honeydu card\n\n",
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return Container();
                    },
                  );
                },
              children: [
                TextSpan(
                  text: "Fully customizable, no hidden fees.",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "\nUse the funds in your wallet instantly",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: CircularButtons(
                backgroundColor: Colors.black,
                borderColor: Colors.white,
                onPressed: () {},
                text: "You're in line!",
                textColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 16.sp,

                  fontWeight: FontWeight.w400,
                  //color: Colors.black,
                )),
          ),
        ],
      )),
    );
  }
}
