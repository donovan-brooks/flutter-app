import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Honeydu/res/images.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import '../Login-signup/login.dart';
import 'item_data.dart';

class OnBoarding extends StatefulWidget {
  @override
  _WithBuilder createState() => _WithBuilder();
}

class _WithBuilder extends State<OnBoarding> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  List<ItemData> data = [
    ItemData(
        Colors.white,
        "assets/images/welcome.png",
        "Track all your payments",
        "Honeydu is the best and fastest way to \n get paid from brands. You can send an\n invoice and get paid with no fees",
        ''),
    ItemData(
        Colors.green,
        "assets/images/welcome.png",
        "Send payment requests",
        "Honeydu is the best and fastest way to \n get paid from brands. You can send an \n invoice and get paid with no fees.",
        ""),
    ItemData(
        Colors.white,
        "assets/images/welcome.png",
        "Get paid instantly",
        "Honeydu is the best and fastest way to \n get paid from brands. You can send an \n invoice and get paid with no fees.",
        ""),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  color: data[index].color,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(images.ic_logo),
                      Image.asset(
                        data[index].image,
                        height: 300,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Column(
                        children: <Widget>[
                          Text(data[index].text1,
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: "Billy",
                                fontWeight: FontWeight.w600,
                              )),
                          Text(data[index].text2,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Billy",
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ],
                  ),
                );
              },
              positionSlideIcon: 0.8,
              slideIconWidget: Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(data.length, _buildDot),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    if (lpage == data.length - 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
    setState(() {
      page = lpage;
    });
  }
}
