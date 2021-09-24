import 'package:flutter/material.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/widgets/widget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DialogPaymentRejection extends StatelessWidget {
  const DialogPaymentRejection({Key key, this.data}) : super(key: key);
  final Invoice data;

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
          Icon(
            Icons.cancel,
            color: Colors.red,
            size: 40.h,
          ),
          WidgetUtil.spaceVertical(5),
          Center(
            child: Text(
              'Rejected',
              style: headingTextStyle.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: appColor.greyLight,
                borderRadius: BorderRadius.circular(7)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: _buildRow(strings.due_date,
                "${DateFormat('M/dd/yyyy').format(data.dueDate)}"),
          ),
          Container(
            decoration: BoxDecoration(
                color: appColor.greyLight,
                borderRadius: BorderRadius.circular(7)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                _buildRow(strings.total_requested, "\$${data.total}"),
                _buildRow(strings.fee_free, "\$0"),
                _buildRow('You paid', "\$0"),
              ],
            ),
          ),
          WidgetUtil.spaceVertical(5),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(strings.close, style: TextStyle(color: appColor.green)),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String startTx, String endTx) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(startTx)),
          WidgetUtil.spaceHorizontal(20),
          Text(endTx),
        ],
      ),
    );
  }
}
