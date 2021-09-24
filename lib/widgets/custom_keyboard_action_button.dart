import 'package:flutter/material.dart';

class KeypadActionButton extends StatefulWidget {
  final IconData label;
  final VoidCallback onPressed;
  final VoidCallback longPress;
  final VoidCallback onBackspace;
  const KeypadActionButton(
      {Key key,
      @required this.label,
      @required this.longPress,
      @required this.onPressed,
      @required this.onBackspace})
      : super(key: key);

  @override
  _KeypadActionButtonState createState() => _KeypadActionButtonState();
}

class _KeypadActionButtonState extends State<KeypadActionButton>
    with SingleTickerProviderStateMixin {
  double iconSize = 26;

  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        microseconds: 10000,
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

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: new GestureDetector(
        onTapDown: _tapDown,
        onTapUp: _tapUp,
        onTap: () async => await widget.onPressed != null
            ? widget.onPressed()
            : widget.onBackspace?.call(),
        onLongPress: widget.longPress,
        // borderRadius: new BorderRadius.circular(40.0),
        child: new Container(
          height: 80.0,
          width: 80.0,
          constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
          decoration: new BoxDecoration(shape: BoxShape.circle),
          child: Align(
            alignment: Alignment.center,
            child: Transform.scale(
              scale: _controller.value == 0 ? 1 : 1 + _controller.value * 0.1,
              child: Icon(
                widget.label,
                color: Colors.black,
                size: iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
