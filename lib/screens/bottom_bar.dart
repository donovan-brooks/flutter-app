import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:Honeydu/screens/home_option.dart';
import 'package:Honeydu/screens/honeydu_card.dart';
import 'package:Honeydu/screens/insights.dart';
import 'package:Honeydu/screens/request_invoice/request_money.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  List _screens = [
    HomeOption(),
    RequestMoney(),
    HoneyduCard(),
    Insights(),
  ];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        unselectedItemColor: Color(0xFFDDDDDD),
        selectedItemColor: Color(0xFF000000),
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.wallet,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.dollarSign,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.creditCard,
              size: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              FontAwesomeIcons.chartLine,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
