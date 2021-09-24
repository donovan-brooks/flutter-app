import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularButtons extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final TextStyle textStyle;
  const CircularButtons(
      {Key key,
      this.text,
      this.textStyle,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .87,
      height: 78.h,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(34.0),
                    side: BorderSide(color: borderColor))),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(textColor),
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 23.h)),
            textStyle: MaterialStateProperty.all(textStyle)),
        child: AutoSizeText(text),
      ),
    );
  }
}

class SquareButtons extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final TextStyle textStyle;
  const SquareButtons(
      {Key key,
      this.text,
      this.textStyle,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.borderColor});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .87,
      height: 78.h,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(color: borderColor))),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            foregroundColor: MaterialStateProperty.all(textColor),
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 23.h)),
            textStyle: MaterialStateProperty.all(textStyle)),
        child: AutoSizeText(text),
      ),
    );
  }
}
