import 'package:flutter/material.dart';

class SecondScreenOn extends StatelessWidget {
  const SecondScreenOn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE7D6F8),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Image.asset("assets/images/welcome.png"),
          SizedBox(
            height: 30,
          ),
          Text(
            'Get paid instantly',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Honeydu is the best and fastest way to get paid from brands. You can send an invoice and get paid with no fees.",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
