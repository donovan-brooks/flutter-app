import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/utils/params_argus.dart';
import 'package:Honeydu/widgets/widget_util.dart';

class DialogPaymentDetailsMoreOptions extends StatelessWidget {
  final Function onPressed;

  DialogPaymentDetailsMoreOptions({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 50.w, height: 4.h, color: Colors.grey[400]),
          WidgetUtil.spaceVertical(20),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => onPressed(ParamsArgus.KEY_PREVIEW),
              style: ElevatedButton.styleFrom(
                  primary: appColor.grey2,
                  elevation: 0,
                  shape: StadiumBorder(),
                  fixedSize: Size.fromHeight(55.h)),
              child: Text(strings.preview_invoice_pdf,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w600)),
            ),
          ),
          WidgetUtil.spaceVertical(10),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => onPressed(ParamsArgus.KEY_REJECT),
              style: ElevatedButton.styleFrom(
                  primary: appColor.white,
                  onPrimary: appColor.red,
                  elevation: 0,
                  shape: StadiumBorder(),
                  side: BorderSide(width: 1, color: appColor.red),
                  fixedSize: Size.fromHeight(55.h)),
              child: Text(strings.reject,
                  style: TextStyle(
                      color: appColor.red, fontWeight: FontWeight.w600)),
            ),
          ),
          WidgetUtil.spaceVertical(10),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(strings.close, style: TextStyle(color: appColor.green)),
          ),
        ],
      ),
    );
  }
}
