import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/custom_keyboard.dart';
import 'package:Honeydu/services/keyboard_key_working.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class AddAccountExpiryDate extends StatefulWidget {
  @override
  _AddAccountExpiryDateState createState() => _AddAccountExpiryDateState();
}

class _AddAccountExpiryDateState extends State<AddAccountExpiryDate> {
  Size _screenSize;
  String text;
  TextEditingController expiryDateController;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    expiryDateController = TextEditingController();
  }

  @override
  void dispose() {
    expiryDateController.dispose();
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 150.w,
                child: Container(
                  alignment: Alignment.center,
                  child: TextFormField(
                    readOnly: false,
                    focusNode: focusNode,
                    cursorHeight: 40,
                    controller: expiryDateController,
                    cursorColor: Color(0xff56BC93),
                    showCursor: true,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.lock),
                        iconSize: 25,
                        color: Color(0xff00BD46),
                        onPressed: () {},
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff849993), width: 0.3),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff849993), width: 0.3),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff849993), width: 0.3),
                      ),
                      labelText: "Expiration  Date",
                      labelStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff849993),
                          height: 0.1),
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 50.h,
        ),
        CustomKeyboard(
          onTextInput: (myText) => insertText(myText, expiryDateController),
          onBackspace: () => backspace(expiryDateController),
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

  @override
  Widget build(BuildContext context) {
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
                          text: "Add a bank using",
                          color: Colors.black,
                          fontSize: 29.sp,
                          fontWeight: FontWeight.bold,
                        )),
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextWidget(
                          text: "your debit card",
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
