import 'package:flutter/material.dart';

class CustomAppBarThemeExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  CustomAppBar()
      : appBar = AppBar(
          title: Text("Custom AppBar Theme"),
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: appBar,
      data: ThemeData.dark(),
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}
