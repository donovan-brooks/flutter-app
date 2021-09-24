import 'package:flutter/material.dart';
import 'package:Honeydu/widgets/text_widget.dart';

class KeypadInputButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final ValueSetter<String> onTextInput;
  const KeypadInputButton(
      {Key key,
      @required this.label,
      @required this.onPressed,
      @required this.onTextInput})
      : super(key: key);

  @override
  _KeypadInputButtonState createState() => _KeypadInputButtonState();
}

class _KeypadInputButtonState extends State<KeypadInputButton>
    with SingleTickerProviderStateMixin {
  double fontSize = 30;

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
        onTap: () => widget.onPressed != null
            ? widget.onPressed()
            : widget.onTextInput?.call(widget.label),
        // borderRadius: new BorderRadius.circular(40.0),
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
