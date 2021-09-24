import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/elevated_button_widget.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';

class ElevatedButtonContainer extends StatelessWidget {
  final Widget label;
  final Function onPress;
  final double verticalPadding;
  final double horizontalPadding;
  final Color color;
  final double circularBorder;
  final double width;
  final bool isDisabled;

  final EdgeInsetsGeometry containerPadding;
  final EdgeInsetsGeometry containerMargin;

  const ElevatedButtonContainer({
    @required this.label,
    @required this.onPress,
    this.verticalPadding = 20,
    this.horizontalPadding = 0,
    this.color = Colors.black,
    this.circularBorder = 50,
    this.width,
    this.containerPadding = const EdgeInsets.all(8.0),
    this.containerMargin = EdgeInsets.zero,
    this.isDisabled = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: containerPadding,
      margin: containerMargin,
      width: width,
      child: ElevatedButtonWidget(
        label: label,
        onPress: onPress,
        circularBorder: circularBorder,
        color: color,
        horizontalPadding: horizontalPadding,
        verticalPadding: verticalPadding,
        isDisabled: isDisabled,
      ),
    );
  }
}

class HowToPayContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;

  const HowToPayContainer({Key key, this.title, this.subtitle, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        height: 170.h,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(left: 91.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: buttonTextStyleNormal,
              ),
              Text(
                subtitle,
                style: appBarTextStyle,
              )
            ],
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
