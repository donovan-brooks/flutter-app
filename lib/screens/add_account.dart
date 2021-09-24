import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/custom_keyboard.dart';
import 'package:Honeydu/services/keyboard_key_working.dart';
import 'package:Honeydu/widgets/custom_textfield.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class AddAccount extends StatefulWidget {
  @override
  _AddAccountState createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  TextEditingController accountNumberController;
  Size _screenSize;
  ValueSetter<String> onTextInput;
  VoidCallback onBackspace;
  String text;

  @override
  void initState() {
    accountNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    accountNumberController.dispose();
    super.dispose();
  }

  get _getInputPart {
    return new Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(left: 47.w, right: 30.w, top: 30.h, bottom: 30.h),
          child: Adddetailstextfield(
            textEditingController: accountNumberController,
            textInputType: TextInputType.number,
            labelText: "Account Number",
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        CustomKeyboard(
          onTextInput: (myText) => (accountNumberController.text.length < 12)
              ? insertText(myText, accountNumberController)
              : null,
          onBackspace: () => backspace(accountNumberController),
          screenSize: _screenSize,
        ),
        SizedBox(
          height: 30.h,
        ),
        ElevatedButtonContainer(
          label: Text("Request"),
          onPress: () {},
          containerPadding: EdgeInsets.only(bottom: 20),
          verticalPadding: 20,
          circularBorder: 50,
          width: _screenSize.width * 0.85,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    accountNumberController.selection = TextSelection.fromPosition(
        TextPosition(offset: accountNumberController.text.length));
    _screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 21.w, top: 10.h),
                child: Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40.sp,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.h, left: 47.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: "Add a bank",
                          color: Colors.black,
                          fontSize: 29.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: "manually",
                          color: Colors.black,
                          fontSize: 29.sp,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              new Container(
                width: _screenSize.width,
                child: _getInputPart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
