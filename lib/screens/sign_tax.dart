import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/models/business_verification_responses.dart';
import 'package:Honeydu/screens/fetch_w_9.dart';
import 'package:Honeydu/screens/success.dart';
import 'package:Honeydu/services/business_personal_account_registration_services.dart';
import 'package:Honeydu/widgets/text_widget.dart';

import '../constants.dart';

class SignTax extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String dateofBirth;
  final String addressLine1;
  final String addressLine2;
  final String cityName;
  final String stateName;
  final String zipCode;
  final String businessName;
  final String accountNumber;
  final bool isBusinessAccount;
  const SignTax({
    Key key,
    @required this.firstname,
    @required this.lastname,
    @required this.dateofBirth,
    @required this.addressLine1,
    @required this.addressLine2,
    @required this.cityName,
    @required this.stateName,
    @required this.zipCode,
    @required this.businessName,
    @required this.accountNumber,
    @required this.isBusinessAccount,
  }) : super(key: key);
  @override
  _SignTaxState createState() => _SignTaxState();
}

class _SignTaxState extends State<SignTax> {
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
        actions: [
          TextButton(
            child: TextWidget(
              text: "SAVE",
              fontSize: 20.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xff9D9D9D),
            ),
            onPressed: () async {
              BusinessVerificationResponse response =
                  await businessPersonalAccountRegistrationServices(
                addressLine1: widget.addressLine1,
                addressLine2: widget.addressLine2,
                businessName: widget.businessName,
                city: widget.cityName,
                dateOfBirth: widget.dateofBirth,
                accountNumber: widget.accountNumber,
                firstName: widget.firstname,
                isBusinessAccount: widget.isBusinessAccount,
                lastName: widget.lastname,
                postalCode: widget.zipCode,
                state: widget.stateName,
              );

              if (response != null) {
                if (response.status == 200) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Success(
                        email: widget.firstname + ' ' + widget.lastname,
                      ),
                    ),
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/BottomBar", (r) => false);
                  });
                } else {
                  if (response.status == 406) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          response.statusMessage.capitalizeFirstofEach,
                          style: kErrorMessage,
                        ),
                        content: Text(
                          response.message.capitalizeFirstofEach,
                          style: kErrorMessage,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Retry",
                              style: kErrorMessage,
                            ),
                          )
                        ],
                      ),
                    );
                  } else if (response.status == 422) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return new AlertDialog(
                          title: new Text(response.message),
                          content: errorMessages(response),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(
                                  "Retry",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          response.statusMessage.capitalizeFirstofEach,
                        ),
                        content: Text(
                          response.message.capitalizeFirstofEach,
                        ),
                      ),
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Sign",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FetchW9())),
                        text: "\n\n\nReview W-9 form",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff74C7A5),
                        ),
                        children: [
                          // TextSpan(
                          //   text: "\n\nReview vendor information",
                          //   recognizer: TapGestureRecognizer()
                          //     ..onTap = () => Navigator.push(context, FetchW9()),
                          // )
                        ]),
                  ]),
            ),
          ),
          DottedLine(
            dashColor: Color(0xff707070),
            dashGapLength: 7,
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.penAlt,
                    color: Color(0xff819996),
                    size: 30.sp,
                  ),
                  Icon(
                    FontAwesomeIcons.waveSquare,
                    color: Color(0xff819996),
                    size: 30.sp,
                  ),
                ],
              ),
            ),
          ),
          DottedLine(
            dashColor: Color(0xff707070),
            dashGapLength: 7,
          ),
          Expanded(
            flex: 2,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Clear",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff74C7A5)),
                  ),
                )),
          ),
          Expanded(
              child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "The W-9 Request for Taxpayer Identification Number and",
              style: greySmallTextStyle,
              children: [
                TextSpan(
                    text:
                        "\nCertification Form requires a signature to confirm the"),
                TextSpan(text: "\nauthenticity of the information"),
                TextSpan(
                    text:
                        "\n\nAll information will be stored electronically and encrypted"),
              ],
            ),
          )),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "The W-9 Request for Taxpayer Identification Number and",
              style: greySmallTextStyle,
              children: [
                TextSpan(
                    text:
                        "\nCertification Form requires a signature to confirm the"),
                TextSpan(text: "\nauthenticity of the information"),
                TextSpan(
                    text:
                        "\n\nAll information will be stored electronically and encrypted"),
              ],
            ),
          ),
          SizedBox(
            height: 50.h,
          )
        ],
      )),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;

  Signature({this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}

Column errorMessages(BusinessVerificationResponse response) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (response.firstNameError != null)
        Text(
          "[X]" + response.firstNameError.capitalizeFirstofEach,
          style: kErrorMessage,
        ),
      if (response.lastNameError != null)
        Text("[X]" + response.lastNameError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.addressError != null)
        Text("[X]" + response.addressError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.businessNameError != null)
        Text("[X]" + response.businessNameError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.cityError != null)
        Text("[X]" + response.cityError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.dateofbirthError != null)
        Text("[X]" + response.dateofbirthError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.einError != null)
        Text("[X]" + response.einError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.postalCodeError != null)
        Text("[X]" + response.postalCodeError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.ssnError != null)
        Text("[X]" + response.ssnError.capitalizeFirstofEach,
            style: kErrorMessage),
      if (response.stateError != null)
        Text("[X]" + response.stateError.capitalizeFirstofEach,
            style: kErrorMessage),
    ],
  );
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}
