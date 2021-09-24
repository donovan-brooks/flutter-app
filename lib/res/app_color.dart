import 'dart:math';

import 'package:flutter/material.dart';

AppColor appColor = AppColor();

class AppColor {
  static final AppColor _appColor = AppColor._i();

  factory AppColor() {
    return _appColor;
  }

  AppColor._i();

  final Color main = Color(0xff1CA85C);
  final Color primaryColor = Color(0xff1CA85C);
  final Color primaryDarkColor = Color(0xff1CA85C);
  final Color primaryLight = Color(0xff1CA85C);
  final Color accentColor = Colors.black;

  final Color bgColor = Color(0xFFF4F4FD);
  final Color bgColor2 = Color(0xFFF7F7FF);
  final Color bgColor3 = Color(0xFFD6D6F3);

  final Color white = Colors.white;
  final Color black = Colors.black;
  final Color transparent = Colors.transparent;

  final Color blackTransparent = Color(0x95000000);

  final Color green = Color(0xff1CA85C);
  final Color greenLight = Color(0xff00D54F);

  final Color grey2 = Color(0xffE4E5EA);
  final Color grey3 = Color(0xffADACAC);
  final Color greyLight = Color(0xffF5F5F5);
  final Color tealDark = Color(0xff899E97);
  final Color red = Color(0xFFFF0808);

  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
    // return Color(int.parse(hexColor, radix: 16));
  }

  Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
    // Random random = new Random();
    // return Color.fromARGB(
    //     255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}
