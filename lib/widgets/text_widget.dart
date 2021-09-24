import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double letterSpacing;

  const TextWidget({
    @required this.text,
    this.color = Colors.black,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.center,
    this.letterSpacing = 0.0,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fontSize * 1.5,
      child: Text(
        text,
        textAlign: textAlign,
        style: new TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
