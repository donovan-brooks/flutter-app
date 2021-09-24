import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/screens/Login-signup/account_details.dart';
import 'package:Honeydu/screens/bottom_bar.dart';
import 'package:Honeydu/screens/Login-signup/enter_phone.dart';
import 'package:Honeydu/widgets/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<bool>(
        future: Future.delayed(
          Duration(seconds: 2),
          () async {
            final SharedPreferences prefs =
                await SharedPreferences.getInstance();
            var value = prefs.getStringList('userData');
            if (value == null)
              return true;
            else
              return false;
          },
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data)
              return Scaffold(
                backgroundColor: Color(0xffFFFFFF),
                body: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 52.82.h),
                      child: Container(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/logo.jpeg",
                          width: 280.0.w,
                        ),
                      ),
                    ),
                    //welcome image of the page ss of that image
                    Padding(
                      padding: EdgeInsets.only(right: 38.44.w),
                      child: Image.asset(
                        "assets/images/welcome.png",
                        width: 300.0.h,
                      ),
                    ),
                    SizedBox(height: 101.13.h),
                    //button inherited from buttons class in widget folder
                    CircularButtons(
                      text: "Sign up",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AccountDetails(),
                          ),
                        );
                      },
                      backgroundColor: Color(0xff1CA85C),
                      textColor: Colors.white,
                      borderColor: Colors.white,
                      textStyle: buttonTextStyle,
                    ),
                    SizedBox(
                      height: 14.0.h,
                    ),
                    //button inherited from widget class from widget folder
                    CircularButtons(
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      text: "Sign in",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EnterPhone(
                              isLogin: true,
                            ),
                          ),
                        );
                      },
                      borderColor: Colors.black,
                      textStyle: buttonTextStyleNormal,
                    )
                  ],
                ),
              );
            else
              return BottomBar();
          } else
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
        },
      ),
    );
  }
}
