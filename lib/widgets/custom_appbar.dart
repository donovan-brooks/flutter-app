import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final bool showLeadingArrow;
  final bool showTitleSpacing;
  final bool centerTitle;
  final double elevation;
  final Color backgroundColor;
  final Widget leading;
  final List<Widget> actionsWidget;

  @override
  Size get preferredSize => AppBar()
      .preferredSize; // Size.fromHeight(kToolbarHeight); // Size.fromHeight(34);

  const CustomAppBar({
    Key key,
    this.title = "",
    this.showBackArrow = false,
    this.showLeadingArrow = true,
    this.showTitleSpacing = false,
    this.centerTitle = false,
    this.elevation = 3,
    this.leading,
    this.backgroundColor,
    this.actionsWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackArrow,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      title: Text(title, style: TextStyle(color: Colors.black)),
      titleSpacing: showTitleSpacing ? 20 : 5,
      leading: showLeadingArrow
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : leading,
      actions: actionsWidget,
    );
  }
}
