import 'package:flutter/material.dart';

class CustomAppBarThemeExample extends StatelessWidget {
  const CustomAppBarThemeExample({super.key});

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

  CustomAppBar({super.key})
      : appBar = AppBar(title: const Text("Custom AppBar Theme"));

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
