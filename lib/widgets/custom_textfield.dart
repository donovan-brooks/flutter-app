import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'text_widget.dart';

Widget textField({String digit, Size screenSize}) {
  return new Container(
    width: screenSize.width * 0.75,
    alignment: Alignment.center,
    child: TextWidget(
      text: digit != null ? "\$$digit" : "\$0",
      fontSize: digit == null
          ? 70.0
          : digit.length < 3
              ? 70.0
              : digit.length < 5
                  ? 60
                  : 50.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

class Adddetailstextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const Adddetailstextfield({
    Key key,
    this.labelText,
    this.textEditingController,
    this.textInputType,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextFormField(
        textInputAction: TextInputAction.done,
        controller: textEditingController,
        readOnly: true,
        cursorHeight: 40,
        enabled: true,
        autofocus: true,
        cursorColor: Color(0xff56BC93),
        showCursor: true,
        keyboardType: textInputType,
        autovalidateMode: AutovalidateMode.always,
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
            borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xff849993), width: 0.3),
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Color(0xff849993),
            height: 0.1,
          ),
        ),
      ),
    );
  }
}
