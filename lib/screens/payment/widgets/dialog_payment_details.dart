import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/widgets/widget_util.dart';
import 'package:intl/intl.dart';

class DialogPaymentDetails extends StatefulWidget {
  final VoidCallback onPressed;
  final bool paymentCompleted;
  final bool paymentRejected;
  final bool paymentViewed;
  final bool showStatus;
  final Invoice data;

  DialogPaymentDetails({
    this.data,
    this.onPressed,
    this.showStatus = false,
    this.paymentCompleted = false,
    this.paymentRejected = true,
    this.paymentViewed = false,
  });

  @override
  _DialogPaymentDetailsState createState() => _DialogPaymentDetailsState();
}

class _DialogPaymentDetailsState extends State<DialogPaymentDetails>
    with TickerProviderStateMixin {
  AnimationController _animationController1;
  AnimationController _animationController2;
  bool showIcon = false;

  @override
  void initState() {
    _animationController1 = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    if (widget.showStatus && widget.paymentViewed)
      this._animationController1.forward().whenComplete(
        () {
          if (widget.paymentCompleted || widget.paymentRejected)
            this._animationController2.forward().whenComplete(
                  () => setState(
                    () {
                      showIcon = true;
                    },
                  ),
                );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _animationController1.dispose();
    _animationController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var getComboTask = '';
    // widget.data.items.forEach((element) {
    //   if (widget.data.items.last == element)
    //     getComboTask += '${element.title}';
    //   else
    //     getComboTask += '${element.title} +';
    // });
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: 50.w, height: 4.h, color: Colors.grey[400]),
          WidgetUtil.spaceVertical(20),
          if (!widget.showStatus)
            Center(
              child: Text(
                'Details',
                style: headingTextStyle.copyWith(fontWeight: FontWeight.w800),
              ),
            ),
          if (widget.showStatus)
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pink.shade300,
                    child: Text(
                      'J',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${widget.data.total.toString().split('.')[0]}',
                        style: headingTextStyle.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      TextSpan(
                        text:
                            '.${widget.data.total.toString().contains('.') ? widget.data.total.toString().split('.')[1] : '00'}',
                        style: TextStyle(
                          fontSize: 20,
                          color: greyColor,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.35,
                )
              ],
            ),
          if (widget.showStatus) WidgetUtil.spaceVertical(40),
          if (widget.showStatus)
            Container(
              height: 30,
              width: width * 0.8,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: width * 0.9,
                    height: 5,
                    // color: Colors.green,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 18.h,
                          width: width * 0.4,
                          child: AnimatedBuilder(
                            animation: _animationController1,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                color: Colors.green,
                                backgroundColor: Colors.grey,
                                value: _animationController1.value,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 18.h,
                          width: width * 0.4,
                          child: AnimatedBuilder(
                            animation: _animationController2,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                color: widget.paymentRejected
                                    ? Colors.red
                                    : Colors.green,
                                backgroundColor: Colors.grey,
                                value: _animationController2.value,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: -7,
                    left: -5,
                    child: Container(
                      height: 18.h,
                      width: 18.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -7,
                    right: 10,
                    left: 0,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -7,
                    right: -5,
                    child: Container(
                      height: 18,
                      width: 18,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: showIcon
                            ? widget.paymentRejected
                                ? Colors.red
                                : Colors.green
                            : Colors.grey,
                      ),
                      child: showIcon
                          ? Icon(
                              widget.paymentRejected
                                  ? Icons.close
                                  : Icons.check,
                              color: Colors.white,
                              size: 12,
                            )
                          : Container(),
                    ),
                  ),
                ],
              ),
            ),
          if (widget.showStatus)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Text(
                    'Request sent',
                    style: greySmallTextStyle,
                  ),
                  Spacer(),
                  Text(
                    'Client viewed',
                    style: greySmallTextStyle,
                  ),
                  if (showIcon) Spacer(),
                  if (!showIcon)
                    SizedBox(width: showIcon ? width * 0.31 : width * 0.2),
                  Text(
                    showIcon
                        ? widget.paymentRejected
                            ? 'Payment rejected'
                            : 'Payment complete'
                        : 'Processing',
                    style: TextStyle(
                      color: showIcon
                          ? widget.paymentRejected
                              ? Colors.red
                              : Colors.green
                          : Colors.grey,
                      fontWeight: FontWeight.w800,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          if (widget.showStatus) WidgetUtil.spaceVertical(20),
          if (widget.showStatus)
            Padding(
              padding: EdgeInsets.only(left: 14.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Request Items',
                  style: TextStyle(
                    color: greyColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          WidgetUtil.spaceVertical(10),
          Container(
            decoration: BoxDecoration(
                color: appColor.greyLight,
                borderRadius: BorderRadius.circular(7)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                if (!widget.showStatus)
                  // for (var item in widget.data.items)
                  //   _buildRow(item.title, "QTY ${item.quantity}"),
                  if (widget.showStatus)
                    _buildRow("$getComboTask", "\$${widget.data.total}"),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: appColor.greyLight,
                borderRadius: BorderRadius.circular(7)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: _buildRow(strings.due_date,
                "${DateFormat('M/dd/yyyy').format(widget.data.dueDate)}"),
          ),
          Container(
            decoration: BoxDecoration(
                color: appColor.greyLight,
                borderRadius: BorderRadius.circular(7)),
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Column(
              children: [
                _buildRow(strings.total_requested, "\$${widget.data.total}"),
                _buildRow(strings.fee_free, "\$0"),
                _buildRow(strings.u_ll_pay, "\$${widget.data.total}"),
              ],
            ),
          ),
          WidgetUtil.spaceVertical(5),
          if (!widget.showStatus)
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onPressed,
                style: ElevatedButton.styleFrom(
                    primary: appColor.grey2,
                    elevation: 0,
                    shape: StadiumBorder(),
                    fixedSize: Size.fromHeight(55.h)),
                child: Text(strings.preview_invoice,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600)),
              ),
            ),
          if (!widget.showStatus) WidgetUtil.spaceVertical(5),
          if (widget.showStatus) Divider(),
          if (widget.showStatus)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'View on web',
                style: headingTextStyle.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          if (widget.showStatus) Divider(),
          if (widget.showStatus)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'View PDF',
                style: headingTextStyle.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
          if (widget.showStatus) Divider(),
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
