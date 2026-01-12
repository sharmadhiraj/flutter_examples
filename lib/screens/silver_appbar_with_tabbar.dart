import 'package:flutter/material.dart';

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  const SilverAppBarWithTabBarScreen({super.key});

  @override
  State<SilverAppBarWithTabBarScreen> createState() =>
      _SilverAppBarWithTabBarState();
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
            title: const Text("Silver AppBar With ToolBar"),
            pinned: true,
            expandedHeight: 160,
            bottom: TabBar(
              tabs: [
                const Tab(text: 'Tab 1'),
                const Tab(text: 'Tab 2'),
                const Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                const Text("Tab 1"),
                const Text("Tab 2"),
                const Text("Tab 3"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
