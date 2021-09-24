import 'package:flutter/material.dart';
import 'package:Honeydu/models/send_invoice_items.dart';
import 'package:Honeydu/screens/request_invoice/preview.dart';
import 'package:Honeydu/widgets/elevated_button_container.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class AddItem extends StatefulWidget {
  final double totalAmout;
  final String email;
  final String logoData;

  const AddItem({
    Key key,
    this.totalAmout,
    this.email,
    this.logoData,
  }) : super(key: key);
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  int quantity = 1;
  List<ItemTiles> itemTiles = [];
  TextEditingController descriptionController;

  double width;
  double height;
  String description;
  @override
  void initState() {
    descriptionController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Container(
        //     width: width * 0.20,
        //     child: Stack(
        //       alignment: Alignment.centerRight,
        //       children: [
        //         CircleAvatar(
        //           backgroundImage: AssetImage(
        //             "assets/images/images/logo_icon.png",
        //           ),
        //         ),
        //         Positioned(
        //           right: 32,
        //           child: CircleAvatar(
        //             backgroundColor: Colors.orange,
        //             child: TextWidget(
        //               text: (widget.logoData != null) ? widget.logoData : "N",
        //               fontSize: 20,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "What are you requesting payment for",
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  showCursor: true,
                  controller: descriptionController,
                  onChanged: (desc) {
                    setState(() {
                      description = desc;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20),
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
                    labelText: "Item description",
                    labelStyle: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity -= 1;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.remove,
                        size: 40,
                        color: Color(0xFFCECECE),
                      ),
                    ),
                    TextWidget(
                      text: "$quantity",
                      color: Colors.black,
                      fontSize: 60,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                      icon: Icon(
                        Icons.add,
                        size: 40,
                        color: Color(0xFFCECECE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: -1,
              child: ElevatedButtonContainer(
                label: Text(
                  "Request",
                  style: TextStyle(
                      color: (description != null)
                          ? Colors.white
                          : Color(0xFF4A4A4A)),
                ),
                color: Colors.black,
                onPress: () => (description != null && description.isNotEmpty)
                    ? {
                        descriptionController.clear(),
                        itemTiles.add(
                          ItemTiles(
                            description != null ? description : " ",
                            quantity >= 0 ? quantity : 0,
                          ),
                        ),
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Preview(
                              email: (widget.email != null &&
                                      widget.email.isNotEmpty)
                                  ? widget.email
                                  : "jack@coral.global",
                              totalAmount: widget.totalAmout >= 0
                                  ? widget.totalAmout
                                  : 0.00,
                              tiles: itemTiles,
                            ),
                          ),
                        ).then((value) => (value != null)
                            ? itemTiles = value
                            : itemTiles.clear()),
                      }
                    : null,
                containerPadding: EdgeInsets.only(bottom: 20),
                verticalPadding: 20,
                circularBorder: 50,
                width: width * 0.85,
              ),
            )
          ],
        ),
      ),
    );
  }
}
