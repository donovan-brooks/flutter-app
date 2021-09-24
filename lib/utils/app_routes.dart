import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final title = "AppRoutes";

class AppRoutes {
  static void pushAndroid(BuildContext context, Widget page) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<dynamic> pushAndroidCallback(
      BuildContext context, Widget page) async {
    return await Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static pushIOS(BuildContext context, Widget page) {
    Navigator.of(context).push(
      new CupertinoPageRoute(builder: (context) => page),
    );
  }

  static Future<dynamic> pushIOSCallback(
      BuildContext context, Widget page) async {
    return await Navigator.of(context).push(
      new CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void pushNamed(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  static void pushReplacementNamed(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

  static void pushReplacementAndroid(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static void pushReplacementIOS(BuildContext context, Widget child) {
    Navigator.of(context).pushReplacement(
      new CupertinoPageRoute(
        builder: (context) => child,
      ),
    );
  }

  static void pushAndRemoveUntilAndroid(BuildContext context, Widget page,
      {String route}) {
    //
    /*Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      ModalRoute.withName(route),
    );*/

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => page),
        (Route<dynamic> route) => false);
  }

  static void pushAndRemoveUntilIOS(
      BuildContext context, Widget page, String route) {
    //
    Navigator.of(context).pushAndRemoveUntil(
      new CupertinoPageRoute(builder: (context) => page),
      ModalRoute.withName(route),
    );
  }

  static void popUntilFirst(BuildContext context) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);

    /*Navigator.popUntil(context, (Route<dynamic> route) {
      bool shouldPop = false;
      Log.loga(title, "popUntilFirst:: >>> ${route.settings}");

      // if (route.settings.name == HomePage.routeName) {
      //   shouldPop = true;
      // }
      return shouldPop;
    });*/
  }

  static void makeFirstAndroid(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(builder: (context) => page),
    );
  }

  static void makeFirstIOS(BuildContext context, Widget page) {
    Navigator.of(context).popUntil((predicate) => predicate.isFirst);
    Navigator.of(context).pushReplacement(
      new CupertinoPageRoute(builder: (context) => page),
    );
  }

  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void dismissAlert(context) {
    Navigator.of(context).pop();
  }
}
