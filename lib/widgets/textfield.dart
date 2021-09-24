import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/constants.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final String titleText;
  final Function(String) onChange;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  TextfieldWidget({
    this.hintText,
    this.titleText,
    this.onChange,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      validator: (titleText == "First Name" || titleText == "Last name")
          ? _validateName
          : (titleText == "E-mail address")
              ? _validateEmail
              : null,
      onChanged: onChange,
      controller: textEditingController,
      cursorColor: Color(0xff849993),
      cursorWidth: 0.8,
      cursorHeight: 40.h,
      showCursor: true,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontSize: 22.sp,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 30.h),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
        ),
        hintText: hintText,
        hintStyle: titleTextStyle,
        labelText: titleText,
        labelStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: Color(0xff849993),
          height: 0.3,
        ),
      ),
    );
  }
}

class Textfield2 extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const Textfield2({
    Key key,
    @required this.hintText,
    @required this.textEditingController,
    @required this.textInputType,
    @required this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      cursorColor: Colors.grey,
      cursorHeight: 22,
      style: TextStyle(
        height: 1.5,
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff99ABA5), width: 0.2),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xff99ABA5), width: 0.2),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          height: 3,
          fontSize: 20,
          fontWeight: FontWeight.w200,
          color: Color(0xff99ABA5),
        ),
      ),
    );
  }
}

class Textfield3 extends StatelessWidget {
  final String hintText;
  final String titleText;
  final Widget suffixicon;
  Textfield3({this.hintText, this.titleText, this.suffixicon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        showCursor: false,
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 40.h, right: 30.w),
            child: Icon(
              Icons.chevron_right_outlined,
              color: Color(0xff849993),
              size: 70.sp,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff849993), width: 0.1),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff849993), width: 0.1),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              height: 7,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          labelText: titleText,
          labelStyle: TextStyle(
              height: 6,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Color(0xff849993)),
        ));
  }
}

String _validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Email is Required";
  } else if (!regExp.hasMatch(value)) {
    return "Invalid Email";
  } else {
    return null;
  }
}

String _validateName(String value) {
  String pattern = r'^[a-zA-Z]+$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "This field is Required";
  } else if (value.length >= 10) {
    return "Name length should only be 1-10";
  } else if (!regExp.hasMatch(value)) {
    return "Name should only contains alphabets";
  } else {
    return null;
  }
}
