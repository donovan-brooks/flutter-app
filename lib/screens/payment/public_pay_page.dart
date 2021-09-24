import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/res/images.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/screens/payment/widgets/dialog_payment_details_more_options.dart';
import 'package:Honeydu/screens/payment/widgets/request_status_bottom_sheet.dart';
import 'package:Honeydu/services/invoice_services.dart';
import 'package:Honeydu/services/push_notification_services.dart';
import 'package:Honeydu/utils/params_argus.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/widget_util.dart';
import 'package:intl/intl.dart';

class PublicPayPage extends StatefulWidget {
  PublicPayPage({this.data});

  final Invoice data;

  @override
  _PublicPayPageState createState() => _PublicPayPageState();
}

class _PublicPayPageState extends State<PublicPayPage> {
  bool bankSelected = false;

  toggleBank() {
    setState(() {
      bankSelected = true;
    });
  }

  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
            ),
            IconButton(
              onPressed: () {
                _onMoreOptions();
              },
              icon: Icon(FontAwesomeIcons.ellipsisH, color: appColor.tealDark),
            ),
          ],
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                Image.asset(images.ic_logo, height: 40.h),
                WidgetUtil.spaceVertical(50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(width: 1, color: Colors.grey[300])),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(FontAwesomeIcons.userAstronaut,
                          color: Colors.black, size: 18),
                      WidgetUtil.spaceHorizontal(25),
                      Text(widget.data.customerName ?? "jack@coral.global"),
                      WidgetUtil.spaceHorizontal(10),
                    ],
                  ),
                ),
                WidgetUtil.spaceVertical(20),
                Text(
                    widget.data.status == 'rejected'
                        ? 'Rejected'
                        : widget.data.status == 'paid'
                            ? 'Completed'
                            : strings.requests,
                    style:
                        TextStyle(color: appColor.tealDark, fontSize: 16.sp)),
                WidgetUtil.spaceVertical(60),
                Text("\$${widget.data.total}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 70.sp,
                        fontWeight: FontWeight.w700)),
                WidgetUtil.spaceVertical(20),
                TextButton(
                  onPressed: () {
                    _onDetails();
                  },
                  child: Text(strings.details,
                      style: TextStyle(
                          color: appColor.greenLight,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500)),
                ),
                WidgetUtil.spaceVertical(50),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  decoration: BoxDecoration(
                      color: appColor.greyLight,
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(strings.due_date,
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp)),
                      Text(
                          "${DateFormat('M/dd/yyyy').format(widget.data.dueDate)}",
                          style:
                              TextStyle(color: Colors.black, fontSize: 17.sp)),
                    ],
                  ),
                ),
                WidgetUtil.spaceVertical(50),
                Text(strings.thank_u_for_business,
                    style: TextStyle(color: Colors.black, fontSize: 16.sp)),
              ],
            ),
          ),
        ),
        if (bankSelected) WidgetUtil.spaceVertical(20),
        if (bankSelected)
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 34.w),
            decoration: BoxDecoration(
              border: Border.all(
                color: lightGreyColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Charles Schwab'),
                Text('****7729'),
              ],
            ),
          ),
        if (bankSelected) WidgetUtil.spaceVertical(30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          child: ElevatedButtonContainer(
            isDisabled: widget.data.type == 'outgoing' &&
                    widget.data.status == 'pending'
                ? true
                : false,
            onPress: () {
              if (widget.data.status == 'pending' &&
                  widget.data.type != 'outgoing')
                _onPayNow();
              else {}
            },
            label: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(widget.data.status == 'rejected'
                            ? 'Rejected'
                            : widget.data.status == 'paid'
                                ? 'Completed'
                                : strings.pay_now),
                      ),
                      Positioned(
                        right: 20,
                        child: Icon(
                          widget.data.status == 'rejected'
                              ? Icons.close
                              : widget.data.status == 'paid'
                                  ? Icons.check
                                  : null,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalPadding: 15,
            color: widget.data.status == 'rejected'
                ? Colors.red
                : widget.data.status == 'paid'
                    ? Colors.green
                    : Colors.black,
          ),
        ),
        WidgetUtil.spaceVertical(20),
      ],
    );
  }

  void _onMoreOptions() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      builder: (context) {
        return DialogPaymentDetailsMoreOptions(
          onPressed: (value) async {
            switch (value) {
              case ParamsArgus.KEY_PREVIEW:
                Navigator.pop(context);
                break;

              case ParamsArgus.KEY_REJECT:
                await rejectInvoice(id: widget.data.id).whenComplete(() async {
                  await showNotification('Payment Rejected',
                      '${widget.data.paymentRequestNote}', 'item x');
                  Navigator.pop(context);
                  requestStatusBottomSheet(
                    context,
                    size.width,
                    size.height,
                    widget.data,
                    changedStatus: 'rejected',
                  );
                }).onError((error, stackTrace) => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: Container(
                            child: CircularProgressIndicator(),
                          ),
                        )));
                break;
            }
          },
        );
      },
    );
  }

  void _onDetails() async {
    requestStatusBottomSheet(
      context,
      size.width,
      size.height,
      widget.data,
    );
  }

  void _onPayNow() async {
    await payInvoice(id: widget.data.id).whenComplete(() async {
      await showNotification(
          'Payment Successful', '${widget.data.paymentRequestNote}', 'item x');
      requestStatusBottomSheet(
        context,
        size.width,
        size.height,
        widget.data,
        changedStatus: 'paid',
      );
    }).onError((error, stackTrace) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Container(
                child: CircularProgressIndicator(),
              ),
            )));

    // toggleBank();
    // AppRoutes.pushAndroid(context, PaymentTypeSelectionScreen());
  }
}
