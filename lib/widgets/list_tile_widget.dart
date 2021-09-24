import 'package:flutter/material.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/screens/payment/public_pay_page.dart';
import 'package:Honeydu/widgets/text_widget.dart';

Widget listViewTiles(
  BuildContext buildContext,
  Invoice data, {
  double width,
}) {
  String afterDecimal, beforeDecimal;
  if (data.total.toString().contains('.')) {
    beforeDecimal = '${data.total}'.split('.')[0];
    afterDecimal = '${data.total}'.split('.')[1];
    afterDecimal = '.' + afterDecimal;
  } else {
    beforeDecimal = data.total.toString();
    afterDecimal = '.00';
  }
  return ListTile(
    onTap: () => Navigator.push(
      buildContext,
      MaterialPageRoute(
        builder: (buildContext) => PublicPayPage(
          data: data,
        ),
      ),
    ),
    contentPadding: EdgeInsets.zero,
    title: Text(
      data.customerName.substring(0, data.customerName.indexOf('@')) ??
          "Payment Note",
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Align(
      alignment: Alignment.centerLeft,
      child: data.status == 'paid'
          ? completedText()
          : data.status == 'pending'
              ? pendingText()
              : rejectedText(),
    ),
    leading: CircleAvatar(
      backgroundColor: greyColor,
      child: Text(
        data.customerName != null ? data.customerName[0].toUpperCase() : 'C',
        style: TextStyle(color: Colors.white),
      ),
    ),
    trailing: Container(
      width: width * 0.25,
      padding: EdgeInsets.only(right: width * 0.01),
      child: Row(
        children: [
          Icon(
            data.type == 'outgoing' ? Icons.arrow_upward : Icons.arrow_downward,
            color: data.status == 'paid'
                ? Colors.green
                : data.status == 'pending'
                    ? Colors.grey
                    : Colors.red,
          ),
          RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
                text: '\$$beforeDecimal',
                style: TextStyle(
                  decoration:
                      data.status == 'completed' || data.status == 'pending'
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                  color:
                      data.status == 'completed' ? Colors.green : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: '$afterDecimal',
                    style: TextStyle(
                      decoration:
                          data.status == 'completed' || data.status == 'pending'
                              ? TextDecoration.none
                              : TextDecoration.lineThrough,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  )
                ]),
          ),
        ],
      ),
    ),
  );
}

TextWidget rejectedText() {
  return TextWidget(
    text: "Rejected by client",
    color: Colors.red,
  );
}

TextWidget completedText() {
  return TextWidget(
    text: "Completed by client",
    color: Colors.green,
  );
}

TextWidget pendingText() {
  return TextWidget(
    text: "Requested",
    color: Colors.grey,
  );
}
