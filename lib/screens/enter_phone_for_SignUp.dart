import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:Honeydu/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:Honeydu/screens/verify_number.dart';
import 'package:Honeydu/services/signup_services.dart';

class EnterNumberForSignUp extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String companyName;
  final String instagram;

  EnterNumberForSignUp({
    Key key,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.companyName,
    @required this.instagram,
  }) : super(key: key);

  @override
  _EnterNumberForSignUpState createState() => _EnterNumberForSignUpState();
}

class _EnterNumberForSignUpState extends State<EnterNumberForSignUp> {
  String phoneCode;
  String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 30.w),
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
                Padding(
                  padding: EdgeInsets.only(top: 6.0.h, right: 27.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        child: AutoSizeText(
                          "SEND CODE",
                          style: appBarTextStyle,
                        ),
                        onPressed: () async {
                          var response = await signUp(
                            phoneNumber:
                                (phoneCode != null && phoneNumber != null)
                                    ? phoneCode + phoneNumber
                                    : null,
                            companyname: widget.companyName,
                            email: widget.email,
                            firstname: widget.firstName,
                            instagram: widget.instagram,
                            lastname: widget.lastName,
                          );
                          response != null
                              ? showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return new AlertDialog(
                                      title: (response.status != 200)
                                          ? new Text(response.message)
                                          : new Text("Success"),
                                      content: (response.status != 200)
                                          ? new Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (response.firstnameError !=
                                                    null)
                                                  Text(
                                                    "[X]" +
                                                        response.firstnameError,
                                                    style: kErrorMessage,
                                                  ),
                                                if (response.lastNameError !=
                                                    null)
                                                  Text(
                                                      "[X]" +
                                                          response
                                                              .lastNameError,
                                                      style: kErrorMessage),
                                                if (response.companyNameError !=
                                                    null)
                                                  Text(
                                                      "[X]" +
                                                          response
                                                              .companyNameError,
                                                      style: kErrorMessage),
                                                if (response.emailError != null)
                                                  Text(
                                                      "[X]" +
                                                          response.emailError,
                                                      style: kErrorMessage),
                                                if (response.instagramError !=
                                                    null)
                                                  Text(
                                                      "[X]" +
                                                          response
                                                              .instagramError,
                                                      style: kErrorMessage),
                                                if (response.phoneNumberError !=
                                                    null)
                                                  Text(
                                                      "[X]" +
                                                          response
                                                              .phoneNumberError,
                                                      style: kErrorMessage),
                                              ],
                                            )
                                          : new Text(response.message),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              (response.status != 200)
                                                  ? Navigator.pop(context)
                                                  : {
                                                      Navigator.pop(context),
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              VerifyNumber(
                                                            phoneNumber:
                                                                phoneCode +
                                                                    phoneNumber,
                                                          ),
                                                        ),
                                                      ),
                                                    },
                                          child: (response.status != 200)
                                              ? Text(
                                                  "Retry",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                )
                                              : Text(
                                                  "Verify",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              : Container();
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60.h,
            ),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Please confirm your ",
                  style: loginSmsTextStyle,
                )),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "phone number ",
                  style: loginSmsTextStyle,
                )),
            SizedBox(
              height: 40.h,
            ),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Sign in instantly with a one-time password,",
                  style: appBarTextStyle,
                )),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "delivered as a text message.",
                  style: appBarTextStyle,
                )),
            SizedBox(
              height: 68.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: AutoSizeText(
                "Phone Number",
                style: appBarTextStyle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 34.w),
              child: TextField(
                onChanged: (number) {
                  phoneNumber = number;
                },
                style: TextStyle(
                    fontSize: 34.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                keyboardType: TextInputType.number,
                cursorHeight: 50.h,
                cursorColor: Colors.black,
                showCursor: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff99ABA5), width: 0.2),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff99ABA5), width: 0.2),
                  ),
                  prefixIcon: CountryCodePicker(
                    initialSelection: "US",
                    onChanged: (countryCode) {
                      phoneCode = countryCode.toString();
                    },
                    textStyle: TextStyle(
                      fontSize: 34.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 62.h,
            ),
            Align(
                alignment: Alignment.center,
                child: AutoSizeText(
                  "Mobile messaging rates may apply.",
                  style: appBarTextStyle,
                )),
          ],
        ),
      ),
    );
  }
}
