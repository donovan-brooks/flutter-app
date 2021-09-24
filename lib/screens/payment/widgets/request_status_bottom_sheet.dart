import 'package:flutter/material.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/screens/payment/widgets/dialog_payment_request_sent.dart';
import 'package:Honeydu/widgets/send_invoice_request_status.dart';

Future requestStatusBottomSheet(
  BuildContext buildContext,
  double width,
  double height,
  Invoice invoice, {
  String changedStatus,
}) {
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      useRootNavigator: true,
      isScrollControlled: true,
      isDismissible: true,
      context: buildContext,
      builder: (context) {
        return new RequestStatusWidget(
          height: height,
          width: width,
          data: invoice,
          changedStatus: changedStatus,
        );
      });
}

Future requestInvoiceBottomSheet(
  BuildContext buildContext,
  double width,
  double height,
  Invoice invoice, {
  String changedStatus,
}) {
  return showModalBottomSheet(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    useRootNavigator: true,
    isScrollControlled: true,
    isDismissible: false,
    context: buildContext,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    builder: (context) {
      return DialogPaymentRequestSend(
        data: invoice,
      );
    },
  );
}
