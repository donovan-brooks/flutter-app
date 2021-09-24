import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/services/edit_profile_services.dart';
import 'package:Honeydu/widgets/text_widget.dart';
import 'package:Honeydu/widgets/textfield.dart';

import '../constants.dart';

class EditProfile extends StatefulWidget {
  final List<String> profileData;
  const EditProfile({Key key, this.profileData}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController companyNameController;
  TextEditingController instagramController;
  String firstName;
  String lastName;
  String email;
  String companyName;
  String instagram;

  @override
  void initState() {
    firstNameController = TextEditingController(text: widget.profileData[2]);
    lastNameController = TextEditingController(text: widget.profileData[3]);
    emailController = TextEditingController(text: widget.profileData[4]);
    companyNameController = TextEditingController(text: widget.profileData[5]);
    instagramController = TextEditingController(text: widget.profileData[6]);
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    companyNameController.dispose();
    instagramController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: headingTextStyle,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.chevron_left),
            color: Colors.black,
            iconSize: 40.sp,
          ),
        ),
        actions: [
          TextButton(
            child: TextWidget(
              text: "Update",
              fontSize: 20.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xff9D9D9D),
            ),
            onPressed: () async {
              var resp = await editProfileServices(
                [
                  widget.profileData[0],
                  widget.profileData[1],
                  firstNameController.text,
                  lastNameController.text,
                  emailController.text,
                  companyNameController.text,
                  instagramController.text
                ],
              );
              Future.delayed(
                Duration(seconds: 1),
                () => resp.status == 200
                    ? {
                        Navigator.pop(context),
                        Navigator.pop(context),
                      }
                    : null,
              );
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    resp.status == 200 ? "Success!" : "Failed!",
                    style: resp.status == 200 ? kSuccessMessage : kErrorMessage,
                  ),
                  content: resp.status == 200
                      ? Text(
                          resp.message,
                          style: kSuccessMessage,
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (resp.message != null)
                              Text(
                                "[X]" + resp.message,
                                style: kErrorMessage,
                              ),
                            if (resp.firstNameError != null)
                              Text(
                                "[X]" + resp.firstNameError,
                                style: kErrorMessage,
                              ),
                            if (resp.lastNameError != null)
                              Text(
                                "[X]" + resp.lastNameError,
                                style: kErrorMessage,
                              ),
                            if (resp.emailError != null)
                              Text(
                                "[X]" + resp.emailError,
                                style: kErrorMessage,
                              ),
                            if (resp.companyNameError != null)
                              Text(
                                "[X]" + resp.companyNameError,
                                style: kErrorMessage,
                              ),
                            if (resp.instagramError != null)
                              Text(
                                "[X]" + resp.instagramError,
                                style: kErrorMessage,
                              ),
                          ],
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 35.sp),
                child: CircleAvatar(
                  backgroundColor: appColor.primaryColor,
                  maxRadius: 40.0.sp,
                  minRadius: 30.0.sp,
                  child: Text(
                    widget.profileData[2][0] ?? 'N',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.w),
                child: Column(
                  children: [
                    TextfieldWidget(
                      titleText: "First Name",
                      textEditingController: firstNameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      onChange: (fname) => firstName = fname,
                    ),
                    TextfieldWidget(
                      textEditingController: lastNameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      onChange: (lastname) => lastName = lastname,
                      titleText: "Last name",
                    ),
                    TextfieldWidget(
                      textEditingController: emailController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress,
                      onChange: (email) => this.email = email,
                      titleText: 'E-mail address',
                    ),
                    TextfieldWidget(
                      textEditingController: companyNameController,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.name,
                      onChange: (company) => this.companyName = company,
                      titleText: "Company name",
                    ),
                    TextfieldWidget(
                      textEditingController: instagramController,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.name,
                      onChange: (instagram) => this.instagram = instagram,
                      titleText: "Instagram",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
