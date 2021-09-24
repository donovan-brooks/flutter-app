import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:Honeydu/constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:Honeydu/screens/Login-signup/verify_number.dart';
import 'package:Honeydu/services/location_services.dart';
import 'package:Honeydu/services/signin_services.dart';
import 'package:Honeydu/services/signup_services.dart';
import 'package:Honeydu/utils/utils.dart';

String registeredNumberError = 'The phone number has already been taken';

class EnterPhone extends StatefulWidget {
  final String email;
  final String firstName;
  final String lastName;
  final String companyName;
  final String instagram;

  final bool isLogin;

  const EnterPhone(
      {Key key,
      this.email,
      this.firstName,
      this.lastName,
      this.companyName,
      this.instagram,
      @required this.isLogin})
      : super(key: key);
  @override
  _EnterPhoneState createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone>
    with SingleTickerProviderStateMixin {
  String phoneCode;
  String phoneNumber;
  AnimationController controller;
  GlobalKey<FormFieldState> formFieldKey = GlobalKey<FormFieldState>();

  List<Address> position;

  getCurrentPosition() async {
    List<Address> p = await determinePosition();
    setState(() {
      position = p;
    });
  }

  @override
  void initState() {
    getCurrentPosition();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 34.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });
    return Scaffold(
      backgroundColor: Colors.white,
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
        actions: [
          TextButton(
              child: AutoSizeText(
                "SEND CODE",
                style: appBarTextStyle,
              ),
              onPressed: () async {
                Utils().hideKeyboard(context);
                widget.isLogin
                    ? _buildLogIn(
                        context,
                        phoneNumber: phoneNumber,
                        phoneCode: phoneCode,
                      )
                    : _buildSignUp(
                        context,
                        phoneNumber: phoneNumber,
                        phoneCode: phoneCode,
                        companyName: widget.companyName,
                        email: widget.email,
                        firstName: widget.firstName,
                        instagram: widget.instagram,
                        lastName: widget.lastName,
                      );
              }),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: AutoSizeText(
                  "Please confirm your \nphone number ",
                  style: loginSmsTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                child: AutoSizeText(
                  "Sign in instantly with a one-time password,\ndelivered as a text message.",
                  style: appBarTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      child: AutoSizeText(
                        "Phone Number",
                        style: appBarTextStyle,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  AnimatedBuilder(
                    animation: offsetAnimation,
                    builder: (context, child) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 34.w - offsetAnimation.value,
                          right: offsetAnimation.value + 34.w,
                        ),
                        child: TextFormField(
                          key: formFieldKey,
                          onChanged: (number) {
                            phoneNumber = number;
                          },
                          style: TextStyle(
                              fontSize: 38.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
                          keyboardType: TextInputType.number,
                          cursorHeight: 50.h,
                          cursorColor: Colors.black,
                          showCursor: true,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff99ABA5), width: 0.2),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff99ABA5), width: 0.2),
                            ),
                            prefixIcon: CountryCodePicker(
                              initialSelection: position != null
                                  ? position.first.countryCode ?? "US"
                                  : "US",
                              onInit: (countryCode) {
                                phoneCode = countryCode.toString();
                              },
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
                          validator: (value) {
                            if (value.length < 10) {
                              controller.forward(from: 0);
                              return '';
                            } else if (value.length > 10) {
                              controller.forward(from: 0);
                              return '';
                            } else if (value.length == 0) {
                              controller.forward(from: 0);
                              return '';
                            } else
                              return null;
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
              AutoSizeText(
                "Mobile messaging rates may apply.",
                style: appBarTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

_buildLogIn(BuildContext context,
    {String phoneCode, String phoneNumber}) async {
  var response = await signIn(
      phoneNumber: (phoneCode != null && phoneNumber != null)
          ? phoneCode + phoneNumber
          : null);

  if (response != null) {
    if (response[0] == "200") {
      Future.delayed(
        Duration(seconds: 2),
        () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyNumber(
                phoneNumber: phoneCode + phoneNumber,
              ),
            ),
          );
        },
      );
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          buttonPadding: EdgeInsets.zero,
          title: new Text(
            "${response[1].capitalizeFirstofEach}",
            style: (response[0] != "200") ? kErrorMessage : kSuccessMessage,
          ),
          content: new Text(
            response[2],
            style: (response[0] != "200") ? kErrorMessage : kSuccessMessage,
          ),
          actions: [
            TextButton(
              onPressed: () => (response[0] != "200")
                  ? Navigator.pop(context)
                  : {
                      Navigator.pop(context),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyNumber(
                            phoneNumber: phoneCode + phoneNumber,
                          ),
                        ),
                      ),
                    },
              child: (response[0] != "200")
                  ? Text("Retry", style: kErrorMessage)
                  : Icon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.green,
                    ),
            ),
          ],
        );
      },
    );
  }
}

_buildSignUp(
  BuildContext context, {
  String phoneCode,
  String phoneNumber,
  String email,
  String firstName,
  String lastName,
  String companyName,
  String instagram,
}) async {
  var response = await signUp(
    phoneNumber: (phoneCode != null && phoneNumber != null)
        ? phoneCode + phoneNumber
        : null,
    companyname: companyName,
    email: email,
    firstname: firstName,
    instagram: instagram,
    lastname: lastName,
  );
  response != null
      ? showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: (response.status != 200)
                  ? new Text(
                      response.message,
                      style: kErrorMessage,
                    )
                  : new Text(
                      "Success",
                      style: kSuccessMessage,
                    ),
              content: (response.status != 200)
                  ? new Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (response.firstnameError != null)
                          Text(
                            "[X]" + response.firstnameError,
                            style: kErrorMessage,
                          ),
                        if (response.lastNameError != null)
                          Text("[X]" + response.lastNameError,
                              style: kErrorMessage),
                        if (response.companyNameError != null)
                          Text("[X]" + response.companyNameError,
                              style: kErrorMessage),
                        if (response.emailError != null)
                          Text("[X]" + response.emailError,
                              style: kErrorMessage),
                        if (response.instagramError != null)
                          Text("[X]" + response.instagramError,
                              style: kErrorMessage),
                        if (response.phoneNumberError != null)
                          Text("[X]" + response.phoneNumberError,
                              style: kErrorMessage),
                      ],
                    )
                  : new Text(response.message),
              actions: [
                (response.phoneNumberError != null &&
                        response.phoneNumberError
                            .equalIgnoreCase(registeredNumberError))
                    ? TextButton(
                        child: Text(
                          "Login",
                          style: kSuccessMessage,
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterPhone(
                              isLogin: true,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                TextButton(
                  onPressed: () => (response.status != 200)
                      ? Navigator.pop(context)
                      : {
                          Navigator.pop(context),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerifyNumber(
                                phoneNumber: phoneCode + phoneNumber,
                              ),
                            ),
                          ),
                        },
                  child: (response.status != 200)
                      ? Text(
                          "Retry",
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(
                          "Verify",
                          style: TextStyle(color: Colors.black),
                        ),
                ),
              ],
            );
          },
        )
      : Container();
}

extension StringExtensions on String {
  bool equalIgnoreCase(String secondString) =>
      this.toLowerCase().contains(secondString.toLowerCase());
}
