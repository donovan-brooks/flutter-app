import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Honeydu/constants.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/services/date_formats.dart';
import '../screens/bottom_bar.dart';
import '../screens/request_invoice/preview.dart';
import 'text_widget.dart';

class RequestStatusWidget extends StatelessWidget {
  final double height;
  final double width;
  final Invoice data;
  final String changedStatus;

  const RequestStatusWidget({
    Key key,
    @required this.height,
    @required this.width,
    @required this.data,
    @required this.changedStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String status = changedStatus ?? data.status;
    return Container(
      height: height * 0.75,
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              child: Text("J"),
            ),
          ),
          title: RichText(
            text: TextSpan(
                text: "\u0024${data.total}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: ".00",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Center(
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: status == 'paid'
                                ? Colors.green
                                : status == 'rejected'
                                    ? Colors.green
                                    : status == 'pending'
                                        ? Colors.green
                                        : Colors.grey,
                            thickness: 5,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: status == 'paid'
                                ? Colors.green
                                : status == 'rejected'
                                    ? Colors.red
                                    : Colors.grey,
                            thickness: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: status == 'paid'
                              ? Colors.green
                              : status == 'rejected'
                                  ? Colors.green
                                  : status == 'pending'
                                      ? Colors.green
                                      : status == 'completed'
                                          ? Colors.white
                                          : Colors.grey,
                          child: Icon(
                            status == 'completed'
                                ? FontAwesomeIcons.solidCheckCircle
                                : null,
                            color: status == 'completed'
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: status == 'paid'
                              ? Colors.green
                              : status == 'rejected'
                                  ? Colors.green
                                  : status == 'pending'
                                      ? Colors.white
                                      : Colors.grey,
                          child: Icon(
                            status == 'pending'
                                ? FontAwesomeIcons.solidCheckCircle
                                : null,
                            color: status == 'pending'
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                        CircleAvatar(
                          radius: 12,
                          backgroundColor:
                              status == 'paid' || status == 'rejected'
                                  ? Colors.white
                                  : Colors.grey,
                          child: Icon(
                            status == 'paid'
                                ? FontAwesomeIcons.solidCheckCircle
                                : status == 'rejected'
                                    ? FontAwesomeIcons.solidTimesCircle
                                    : null,
                            color: status == 'paid'
                                ? Colors.green
                                : status == 'rejected'
                                    ? Colors.red
                                    : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 0,
                    left: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Request sent",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Text(
                              "Client viewed",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          status == 'paid'
                              ? "Payment completed"
                              : status == 'rejected'
                                  ? "Payment rejected"
                                  : "Processing",
                          style: TextStyle(
                            color: status == 'paid'
                                ? Colors.green
                                : status == 'rejected'
                                    ? Colors.red
                                    : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Request items",
                  style: appBarTextStyle,
                )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: modelBottomSheetItemRow(
                      data.paymentRequestNote, "\$${data.total}")),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: modelBottomSheetItemRow(
                      "Due date", ddMMyyyyFormat(data.dueDate))),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    modelBottomSheetItemRow(
                        "Total requested", "\u0024${data.total}"),
                    modelBottomSheetItemRow("Fee (free)", "\u00240"),
                    modelBottomSheetItemRow(
                        "You'll receive", "\u0024${data.total}"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: TextButton(
                child: TextWidget(
                  text: "View on web",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {},
              ),
            ),
            divider(),
            Expanded(
              flex: 2,
              child: TextButton(
                child: TextWidget(
                  text: "View PDF",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {},
              ),
            ),
            divider(),
            Expanded(
              flex: 2,
              child: TextButton(
                child: TextWidget(
                  text: "Close",
                  fontSize: 18,
                  color: Color(0xff1CA85C),
                  fontWeight: FontWeight.w500,
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

upperDivider(double width) {
  return Container(
    width: width * 0.15,
    padding: EdgeInsets.symmetric(vertical: 10.0),
    child: Divider(
      thickness: 5.0,
      color: Colors.black,
      height: 2,
    ),
  );
}

modelBottomSheetItemRow(String firstData, String secondData) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          firstData,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
      Expanded(
        child: TextWidget(
          text: secondData,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.end,
          fontSize: 14,
        ),
      ),
    ],
  );
}
