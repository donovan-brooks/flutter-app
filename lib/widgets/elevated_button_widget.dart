import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Widget label;
  final Function onPress;
  final double verticalPadding;
  final double horizontalPadding;
  final Color color;
  final double circularBorder;
  final bool isDisabled;

  const ElevatedButtonWidget(
      {@required this.label,
      @required this.onPress,
      this.verticalPadding,
      this.horizontalPadding,
      this.color,
      this.circularBorder,
      this.isDisabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: label,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(color == Colors.black ? 2 : 0),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
            isDisabled ? color.withOpacity(0.2) : color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularBorder),
            side: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
