import 'package:flutter/material.dart';

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("Silver AppBar With ToolBar"),
            pinned: true,
            expandedHeight: 160,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Text("Tab 1"),
                Text("Tab 2"),
                Text("Tab 3"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
