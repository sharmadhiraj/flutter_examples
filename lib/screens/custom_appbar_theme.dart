import 'package:flutter/material.dart';

class CustomAppBarThemeExample extends StatelessWidget {
  const CustomAppBarThemeExample({Key? key}) : super(key: key);

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

  CustomAppBar({Key? key})
      : appBar = AppBar(title: Text("Custom AppBar Theme")),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: appBar,
    );
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}
