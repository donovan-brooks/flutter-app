import 'package:Honeydu/screens/enter_phone_for_SignUp.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/screens/enter_phone_for_SignUp.dart';
import 'package:Honeydu/widgets/text_widget.dart';
import 'package:Honeydu/widgets/textfield.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  String email;
  String firstName;
  String lastName;
  String companyName;
  String instagram;

  TextEditingController _emailTextEditingController;
  TextEditingController _firstNameTextEditingController;
  TextEditingController _lastNameTextEditingController;
  TextEditingController _companyNameTextEditingController;
  TextEditingController _instagramTextEditingController;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _firstNameTextEditingController = TextEditingController();
    _lastNameTextEditingController = TextEditingController();
    _companyNameTextEditingController = TextEditingController();
    _instagramTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _companyNameTextEditingController.dispose();
    _instagramTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h, left: 22.w),
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
                  padding: EdgeInsets.only(top: 6.0.h, right: 25.w),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      child: AutoSizeText(
                        "NEXT",
                        style: appBarTextStyle,
                      ),
                      onPressed: () {
                        if (email != null &&
                            firstName != null &&
                            lastName != null &&
                            companyName != null &&
                            instagram != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EnterNumberForSignUp(
                                companyName: companyName,
                                email: email,
                                firstName: firstName,
                                instagram: instagram,
                                lastName: lastName,
                              ),
                            ),
                          );
                        } else {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                                bottom: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            builder: (context) => Container(
                              width: size.width * 0.90,
                              height: size.height * 0.1,
                              color: Colors.white,
                              child: Center(
                                child: TextWidget(
                                  text: "Some Fields are missing",
                                  color: Colors.red,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: AutoSizeText(
                "Account Details",
                style: headingTextStyle,
                //textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 40.0.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w),
              child: Column(
                children: <Widget>[
                  TextfieldWidget(
                    //hintText: "Devin",
                    titleText: "First Name",
                    onChange: (fname) {
                      firstName = fname;
                    },
                    textEditingController: _firstNameTextEditingController,
                  ),
                  TextfieldWidget(
                    //hintText: "Picciolini",
                    titleText: "Last name",
                    onChange: (lname) {
                      lastName = lname;
                    },
                    textEditingController: _lastNameTextEditingController,
                  ),
                  TextfieldWidget(
                    //hintText: "dpicciolini@gmail.com",
                    titleText: 'E-mail address',
                    onChange: (mail) {
                      email = mail;
                    },
                    textEditingController: _emailTextEditingController,
                  ),
                  TextfieldWidget(
                    //hintText: "Coral",
                    titleText: "Company name (optional)",
                    onChange: (company) {
                      companyName = company;
                    },
                    textEditingController: _companyNameTextEditingController,
                  ),
                  TextfieldWidget(
                    //hintText: "@coral.lab",
                    titleText: "Instagram",
                    onChange: (insta) {
                      instagram = insta;
                    },
                    textEditingController: _instagramTextEditingController,
                  ),
                  SizedBox(height: 73.h),
                  Padding(
                    padding: EdgeInsets.only(right: 50.w),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "By proceeding, you agree to our",
                        style: titleTextStyle,
                        children: [
                          TextSpan(
                            text: "\nTerms & Conditions",
                            style: TextStyle(
                              fontFamily: "Airbnb Cereal App",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff707070),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
