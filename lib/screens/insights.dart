import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/graph.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class Insights extends StatefulWidget {
  @override
  _InsightsState createState() => _InsightsState();
}

class _InsightsState extends State<Insights> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 8.0),
          child: TextWidget(
            text: "Insights",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Stack(
              children: [
                Graph(),
                Positioned(
                    right: 10,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            text: "July income",
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          Icon(
                            Icons.download,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  left: 20,
                  top: 20,
                  child: TextWidget(
                    text: "\$7,550",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 70,
                  child: Row(
                    children: [
                      Icon(
                        Icons.file_download,
                        color: Colors.grey,
                      ),
                      TextWidget(
                        text: "\$50 less than last month",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(child: statusContainer(size, "\$7,281", "Completed")),
            Expanded(child: statusContainer(size, "\$17,281", "Scheduled")),
            Expanded(child: statusContainer(size, "\$561", "Overdue")),
          ],
        ),
      ),
    );
  }
}

Widget statusContainer(Size size, String amount, String status) {
  return Container(
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          blurRadius: 10,
          offset: Offset(0, 0), // Shadow position
        ),
      ],
    ),
    child: ListTile(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 10),
      leading: TextWidget(
        text: status,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      trailing: TextWidget(
        text: amount,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
