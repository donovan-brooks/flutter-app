import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import '../widgets/text_widget.dart';

class HoneyduCard extends StatefulWidget {
  @override
  _HoneyduCardState createState() => _HoneyduCardState();
}

class _HoneyduCardState extends State<HoneyduCard> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 49.w, vertical: 30.h),
            child: Text(
              "Use your funds right away",
              style: TextStyle(
                  fontSize: 37.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            height: 200,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/svg-images/card-honeydu.svg",
              //width: 180.0.w,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              child: TextWidget(
                text: "Meet the Honeydu card ",
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Fully customizable, no hidden fees.",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "\nUse the funds in your wallet instantly"),
                  ]),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 30.h),
              child: ElevatedButtonContainer(
                color: !isClicked ? Colors.black : Colors.white,
                label: TextWidget(
                  text: isClicked ? "You're in line! " : "Join the wallet",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: isClicked ? Colors.black : Colors.white,
                ),
                onPress: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                width: size.width * 0.9,
              ))
        ],
      )),
    );
  }
}
