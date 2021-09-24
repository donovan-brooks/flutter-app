import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String titleText;
  final Function(String) onChange;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Color borderColor;
  final double borderWidth;
  final Color textColor;
  final FontWeight textFontWeight;
  final double textFontSize;
  final double textFontHeight;

  TextFormFieldWidget({
    this.hintText,
    this.titleText,
    this.onChange,
    this.textEditingController,
    this.textInputType = TextInputType.text,
    this.borderColor = const Color(0xff849993),
    this.borderWidth = 0.1,
    this.textColor = Colors.black,
    this.textFontHeight = 7,
    this.textFontSize = 16,
    this.textFontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: textEditingController,
      showCursor: false,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: borderWidth),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          height: textFontHeight,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: textColor,
        ),
        labelText: titleText,
        labelStyle: TextStyle(
          height: textFontHeight,
          fontSize: textFontSize,
          fontWeight: textFontWeight,
          color: borderColor,
        ),
      ),
    );
  }
}
