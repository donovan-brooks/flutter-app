import 'dart:math' as math;
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class ItemRequestMoneyContact extends StatelessWidget {
  final Contact contactDetails;
  final VoidCallback onPressed;

  ItemRequestMoneyContact({this.contactDetails, this.onPressed});

  final rnd = math.Random();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      tileColor: Colors.white,
      leading: CircleAvatar(
          // backgroundColor: Colors.pink,
          // backgroundColor: Color(rnd.nextInt(0xffffffff)),
          backgroundColor:
              Colors.primaries[rnd.nextInt(Colors.primaries.length)]
                  [rnd.nextInt(9) * 100],
          child: TextWidget(
              text: contactDetails.displayName != null
                  ? contactDetails.displayName.substring(0, 1)
                  : "0",
              fontSize: 20,
              color: Colors.white)),
      title: Text(contactDetails.displayName ?? "",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      subtitle: Text(contactDetails.familyName ?? "",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400)),
      trailing: Icon(Icons.help),
    );
  }
}
