import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/res/app_color.dart';
import 'package:Honeydu/res/images.dart';
import 'package:Honeydu/res/strings.dart';
import 'package:Honeydu/utils/params_argus.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/widget_util.dart';

class PaymentTypeSelectionScreen extends StatefulWidget {
  @override
  _PaymentTypeSelectionScreenState createState() =>
      _PaymentTypeSelectionScreenState();
}

class _PaymentTypeSelectionScreenState
    extends State<PaymentTypeSelectionScreen> {
  String _selectedPaymentType = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(images.ic_logo, height: 40.h),
              WidgetUtil.spaceVertical(50),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 50.h),
                child: Text(strings.choose_how_u_want_pay,
                    style: TextStyle(
                        color: appColor.black,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold)),
              ),
              WidgetUtil.spaceVertical(10),
              _buildType(
                type: ParamsArgus.KEY_PAYMENT_TYPE_BANK,
                title: strings.bank_acc,
                descr: strings.free_,
                selected:
                    _selectedPaymentType == ParamsArgus.KEY_PAYMENT_TYPE_BANK,
              ),
              _buildType(
                type: ParamsArgus.KEY_PAYMENT_CARD,
                title: strings.credit_card,
                descr: strings.credit_card_or_debit_accept,
                selected: _selectedPaymentType == ParamsArgus.KEY_PAYMENT_CARD,
              ),
            ],
          ),
        ),
        if (_selectedPaymentType.isNotEmpty)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButtonContainer(
              onPress: () {},
              label: Text(strings.next),
              verticalPadding: 15,
            ),
          ),
        WidgetUtil.spaceVertical(20),
      ],
    );
  }

  Widget _buildType(
      {String type, String title, String descr, bool selected = false}) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentType = type;
        });
      },
      child: Container(
        color: selected ? appColor.primaryColor : appColor.greyLight,
        margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 30.w),
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 70.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    color: selected ? appColor.white : appColor.black,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600)),
            WidgetUtil.spaceVertical(7),
            Text(descr,
                style: TextStyle(
                    color: selected ? appColor.white : appColor.grey3,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
