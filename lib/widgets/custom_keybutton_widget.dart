import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class NewKeyButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  const NewKeyButton({Key key, @required this.label, @required this.onPressed})
      : super(key: key);

  @override
  _NewKeyButtonState createState() => _NewKeyButtonState();
}

class _NewKeyButtonState extends State<NewKeyButton>
    with SingleTickerProviderStateMixin {
  double fontSize = 30;

  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1,
      ),
      lowerBound: 0,
      upperBound: 10,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () async {
          _controller.forward();
          await Future.delayed(Duration(milliseconds: 200));
          _controller.reverse();
          await widget.onPressed();
        },
        child: new Container(
          height: 80.0,
          width: 80.0,
          constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: new Center(
            child: Transform.scale(
              scale: _controller.value == 0 ? 1 : 1 + _controller.value * 0.1,
              child: TextWidget(
                text: widget.label,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget newKeyboardKeys({
  String firstKey,
  String secondKey,
  String thirdKey,
  Function onPressFirst,
  Function onPressSecond,
  Function onPressThird,
}) {
  return new Expanded(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NewKeyButton(
          label: firstKey,
          onPressed: onPressFirst,
        ),
        NewKeyButton(
          label: secondKey,
          onPressed: onPressSecond,
        ),
        NewKeyButton(
          label: thirdKey,
          onPressed: onPressThird,
        ),
      ],
    ),
  );
}

class NewKeyboardActionButton extends StatefulWidget {
  final IconData label;
  final VoidCallback onPressed;
  final VoidCallback longPress;
  const NewKeyboardActionButton(
      {Key key,
      @required this.label,
      @required this.longPress,
      @required this.onPressed})
      : super(key: key);

  @override
  _NewKeyboardActionButtonState createState() =>
      _NewKeyboardActionButtonState();
}

class _NewKeyboardActionButtonState extends State<NewKeyboardActionButton>
    with SingleTickerProviderStateMixin {
  double iconSize = 30;

  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        microseconds: 10,
      ),
      lowerBound: 0,
      upperBound: 10,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () async {
        _controller.forward();
        await Future.delayed(Duration(milliseconds: 200));
        _controller.reverse();
        await widget.onPressed();
      },
      onLongPress: () async {
        _controller.forward();
        await Future.delayed(Duration(milliseconds: 200));
        _controller.reverse();
        await widget.longPress();
      },
      // borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Transform.scale(
          scale: _controller.value == 0 ? 1 : 1 + _controller.value * 0.1,
          child: new Icon(
            widget.label,
            color: Colors.black,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
