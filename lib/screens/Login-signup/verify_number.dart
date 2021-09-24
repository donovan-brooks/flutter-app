import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/models/signIn.dart';
import 'package:Honeydu/screens/bottom_bar.dart';
import 'package:Honeydu/services/shared_preferences_services.dart';
import 'package:Honeydu/services/signin_services.dart';
import 'package:Honeydu/services/verify_otp_services.dart';
import 'package:Honeydu/utils/utils.dart';
import 'package:Honeydu/widgets/confetti_page.dart';

import '../../constants.dart';

class VerifyNumber extends StatefulWidget {
  final String phoneNumber;
  VerifyNumber({@required this.phoneNumber});
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  TextEditingController otpController;
  String otp;

  @override
  void initState() {
    otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          iconSize: 40,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.chevron_left),
          color: Color(0xff000000),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Center(
              child: InkWell(
                onTap: () async => sendVerificationRequest(
                    this.otp, widget.phoneNumber, context, otpController),
                child: Text(
                  "SEND CODE",
                  style: appBarTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AutoSizeText(
              "Enter your code",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            AutoSizeText(
              "Code sent to ${widget.phoneNumber}",
              style: appBarTextStyle,
              textAlign: TextAlign.center,
            ),
            PinCodeFields(
              controller: otpController,
              length: 4,
              onChange: (code) {
                this.otp = code;
              },
              onComplete: (code) async {
                Utils().hideKeyboard(context);
                sendVerificationRequest(
                  code,
                  widget.phoneNumber,
                  context,
                  otpController,
                );
              },
              obscureText: false,
              fieldBorderStyle: FieldBorderStyle.Square,
              responsive: false,
              fieldHeight: 67.0.h,
              fieldWidth: 55.0.w,
              borderWidth: 1.0,
              activeBorderColor: Color(0xff1CA85C),
              activeBackgroundColor: Color(0xff85DCBA),
              borderRadius: BorderRadius.circular(5.0),
              keyboardType: TextInputType.number,
              autoHideKeyboard: false,
              fieldBackgroundColor: Color(0xffE4E4E4),
              autofocus: true,
              borderColor: Color(0xffE4E4E4),
            ),
            AutoSizeText(
              "Didn’t get a code?",
              style: appBarTextStyle,
              textAlign: TextAlign.center,
            ),
            InkWell(
              onTap: () => resendOTP(widget.phoneNumber),
              child: Text(
                "Resend code",
                style: appBarTextStyle.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

resendOTP(String phoneNumber) async {
  await signIn(phoneNumber: phoneNumber);
}

sendVerificationRequest(
  String code,
  String phoneNumber,
  BuildContext context,
  TextEditingController controller,
) async {
  PersonalInformation response;
  if (code != null && code.length == 4) {
    response = await verifyOtp(
      phoneNumber: phoneNumber,
      otp: code,
    );
    if (response != null) {
      if (response.status != 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: new Text(response.errorMessage),
              actions: [
                TextButton(
                  onPressed: () {
                    controller.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Retry",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        List<String> _result = [];
        _result.insert(0, "Bearer ${response.token}");
        _result.insert(1, response.id.toString());
        _result.insert(2, response.name.split(" ")[0]);
        _result.insert(3, response.name.split(" ")[1]);
        _result.insert(4, response.email);
        _result.insert(5, response.companyName);
        _result.insert(6, response.instagram);
        savePreferences(_result);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConfettiPage(route: BottomBar()),
          ),
        );
      }
    } else {
      Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
