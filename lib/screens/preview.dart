import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/models/invoice_list.dart';
import 'package:Honeydu/models/send_invoice_items.dart';
import 'package:Honeydu/screens/payment/widgets/request_status_bottom_sheet.dart';
import 'package:Honeydu/screens/pdf_previrew_page.dart';
import 'package:Honeydu/services/date_formats.dart';
import 'package:Honeydu/services/send_invoice_services.dart';
import 'package:Honeydu/widgets/confetti_page.dart';
import 'package:Honeydu/widgets/drop_down.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';
import 'package:path_provider/path_provider.dart';

import '../constants.dart';

String monthly = "Monthly", weekly = "Weekly", custom = "Custom";

class Preview extends StatefulWidget {
  @required
  final double totalAmount;
  @required
  final String email;
  @required
  final List<ItemTiles> tiles;

  const Preview({
    this.totalAmount,
    this.email,
    this.tiles,
  });

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  String defaultChoice = monthly;
  int totalQuantity = 0;
  bool isSetRecurring = false;
  double width;
  bool isDateSelected = true;
  DateTime dueDate;
  double height;
  bool isDateDisable = true;

  @override
  void initState() {
    for (var i = 0; i < widget.tiles.length; i++) {
      totalQuantity += widget.tiles[i].quantity;
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              if (dueDate == null && isSetRecurring) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Container(
                      child: ListTile(
                        title: Text("Please select due data"),
                      ),
                    ),
                  ),
                );
              } else {
                if (dueDate != null) {
                  var response = await sendInvoice(
                    sendInvoice: SendInvoice(
                        customerEmail: widget.email,
                        dueDate: ddMMyyyyFormat(dueDate),
                        paymentRequestNote: widget.tiles.first.description,
                        total: (widget.totalAmount * totalQuantity),
                        items: List.generate(
                          widget.tiles.length,
                          (index) => SendInvoiceItemsList(
                                  widget.totalAmount,
                                  widget.tiles[index].quantity,
                                  widget.tiles[index].description,
                                  widget.tiles[index].description)
                              .toMap(),
                        )),
                  );
                  if (response[0] == 200) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfettiPage(
                          route: null,
                          revert: true,
                        ),
                      ),
                    ).then((value) => requestInvoiceBottomSheet(
                        context,
                        width,
                        height,
                        Invoice(
                          dueDate: dueDate,
                          status: 'completed',
                          total: (widget.totalAmount * totalQuantity)
                              .toStringAsFixed(2),
                          paymentRequestNote: widget.tiles.first.description,
                          customerName: widget.email.split("@")[0],
                          type: 'outgoing',
                          frequency: 'once',
                        )));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return new AlertDialog(
                          title: Text(response[1]),
                          content: new Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (response[2] != null)
                                Text(
                                  "[X]" + response[2],
                                  style: kErrorMessage,
                                ),
                              if (response[3] != null)
                                Text("[X]" + response[3], style: kErrorMessage),
                              if (response[4] != null)
                                Text("[X]" + response[4], style: kErrorMessage),
                              if (response[5] != null)
                                Text("[X]" + response[5], style: kErrorMessage),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "Retry",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  setState(() {
                    isDateSelected = false;
                  });
                }
              }

              /// commented as to show confetti only after one clicks on request
            },
            child: TextWidget(
              text: "REQUEST",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context, null),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: -1,
              child: Container(
                width: width,
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        width: width * 0.50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFDEDEDE),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                FontAwesomeIcons.user,
                                size: 18,
                              ),
                              Flexible(
                                child: Text(
                                  (widget.email != null)
                                      ? "${widget.email}"
                                      : "jack@coral.global",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.cog),
                        padding: EdgeInsets.only(bottom: 5),
                        iconSize: 26,
                        color: Colors.grey,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(41),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            builder: (context) => Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 18.0, right: 5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    upperDivider(width),
                                    listTileItem(
                                      "Preview invoice",
                                      FontAwesomeIcons.solidFilePdf,
                                      () {
                                        setState(() {
                                          isDateDisable = false;
                                          isSetRecurring = true;
                                        });
                                        loadPDF(
                                                email: widget.email,
                                                total: widget.totalAmount)
                                            .then((value) async {
                                          print('value: $value');
                                          Navigator.pop(context);
                                          if (value != null) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PdfViewerPage(
                                                            localPath: value)));
                                            // Directory appDocDir = await getApplicationDocumentsDirectory();
                                            // String appDocPath = appDocDir.path;
                                            //
                                            // File pdf = File(appDocPath + 'sdfdf.pdf');
                                            // pdf.writeAsBytes(value as List<int>);
                                          }
                                        });
                                        // Navigator.pop(context);
                                      },
                                    ),
                                    divider(),
                                    listTileItem(
                                      "Set recurring",
                                      FontAwesomeIcons.clock,
                                      () {
                                        setState(() {
                                          isDateDisable = false;
                                          isSetRecurring = true;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    divider(),
                                    listTileItem(
                                      "Change invoice #",
                                      FontAwesomeIcons.receipt,
                                      () {
                                        setState(() {
                                          isSetRecurring = false;
                                          isDateDisable = true;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    divider(),
                                    listTileItem(
                                      "Attach W9",
                                      FontAwesomeIcons.fileUpload,
                                      () {
                                        setState(() {
                                          isSetRecurring = false;
                                          isDateDisable = true;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                    divider(),
                                    listTileItem(
                                      "Don't sync to Quickbooks",
                                      Icons.close_outlined,
                                      () {
                                        setState(() {
                                          isSetRecurring = false;
                                          isDateDisable = true;
                                        });
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: widget.tiles.length > 2
                  ? !isSetRecurring
                      ? 4
                      : 3
                  : widget.tiles.length,
              child: Container(
                width: width * 0.80,
                padding: EdgeInsets.only(left: 5.0),
                margin: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFDEDEDE),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ListView.builder(
                  addAutomaticKeepAlives: false,
                  shrinkWrap: true,
                  itemCount: widget.tiles.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 05),
                    title: Text(
                      "${widget.tiles[index].description}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Text("${widget.tiles[index].quantity}"),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: !isSetRecurring ? 03 : 04,
              child: Column(
                children: [
                  isDateDisable
                      ? GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            ).then(
                              (date) {
                                setState(() {
                                  if (date != null) {
                                    dueDate = date;
                                    isDateSelected = true;
                                  }
                                });
                              },
                            );
                          },
                          child: Container(
                            width: width * 0.80,
                            height: !isSetRecurring ? height * 0.07 : 0,
                            padding: EdgeInsets.symmetric(
                                vertical: !isSetRecurring ? 15 : 0),
                            margin: EdgeInsets.symmetric(
                                vertical: !isSetRecurring ? 15 : 0),
                            decoration: BoxDecoration(
                              color: (isDateDisable == true)
                                  ? Colors.grey[200]
                                  : Color(0xFFDEDEDE),
                              border: Border.all(
                                color: (isDateDisable == true)
                                    ? isDateSelected
                                        ? Colors.grey[200]
                                        : Colors.red
                                    : Color(0xFFDEDEDE),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: TextWidget(
                                    text: (dueDate != null)
                                        ? ddMMyyyyFormat(dueDate)
                                        : "Due Date",
                                    fontSize: 16,
                                    color: isDateSelected
                                        ? Colors.grey
                                        : Colors.red,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Positioned(
                                  child: Icon(
                                    FontAwesomeIcons.calendar,
                                    color: isDateSelected
                                        ? Colors.grey[200]
                                        : Colors.red,
                                    size: 20,
                                  ),
                                  right: 20,
                                  bottom: 3,
                                ),
                              ],
                            ),
                          ),
                        )
                      : CustomDropdown(
                          enabledColor: Colors.grey[100],
                          onChanged: (value) {
                            if (value == 0) {
                              setState(() {
                                defaultChoice = monthly;
                              });
                            } else if (value == 1) {
                              setState(() {
                                defaultChoice = weekly;
                              });
                            } else if (value == 2) {
                              setState(() {
                                defaultChoice = custom;
                              });
                            }
                          },
                          hint: defaultChoice,
                          items: [
                            CustomDropdownItem(text: monthly),
                            CustomDropdownItem(text: weekly),
                            CustomDropdownItem(text: custom),
                          ],
                          openIcon: Icon(
                            FontAwesomeIcons.caretUp,
                            color: Color(0xFFE4E5EA),
                            size: 20,
                          ),
                          closedIcon: Icon(
                            FontAwesomeIcons.caretDown,
                            color: Color(0xFFE4E5EA),
                            size: 20,
                          ),
                        ),
                  if (isSetRecurring)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textFormField("# of payments", width),
                        textFormField("Start date", width),
                      ],
                    ),
                  ElevatedButtonContainer(
                    width: width * 0.85,
                    verticalPadding: 18,
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 8),
                        Text("Add another amount"),
                      ],
                    ),
                    onPress: () => Navigator.pop(
                      context,
                      widget.tiles,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: !isSetRecurring ? 03 : 02,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Total Requesting", style: blackLightTextStyle),
                  Text(
                    "\$${(widget.totalAmount * totalQuantity).toStringAsFixed(2)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 40,
                        letterSpacing: 2.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listTileItem(
      String listTileText, IconData listTileIconData, Function onPressed) {
    return ListTile(
      leading: Icon(
        listTileIconData,
        color: Colors.black,
      ),
      title: Text(listTileText, style: blackLightTextStyle),
      onTap: onPressed,
    );
  }
}

Widget divider() {
  return Row(
    children: [
      Expanded(
        child: Divider(
          height: 2,
          thickness: 1,
          color: Color(0xFFEDEDED),
        ),
      )
    ],
  );
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

textFormField(String label, double width) {
  return Container(
    width: width * 0.35,
    child: TextFormField(
      cursorColor: Colors.black,
      showCursor: true,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[300],
        ),
      ),
    ),
  );
}
