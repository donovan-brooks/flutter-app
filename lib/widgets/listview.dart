import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class MyListViewBuilder extends StatelessWidget {
  final Widget leading;
  final String title;
  final String subtitle;
  final Widget trailing;
  final TextStyle textcolor;

  const MyListViewBuilder(
      {Key key,
      this.leading,
      this.textcolor,
      this.title,
      this.subtitle,
      this.trailing});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.0.w),
                child: leading),
            trailing: trailing,
            subtitle: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
                child: Text(title, style: textcolor)),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              child: TextWidget(
                text: title,
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        });
  }
}
