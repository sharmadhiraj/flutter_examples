import 'package:flutter/material.dart';

import '../model/page.dart';
import '../util/data.dart';
import '../util/method.dart';
import 'bottom-nav-icon-size.dart';
import 'network-example.dart';
import 'silver-appbar-with-tabbar.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: ListView(
        children: pages()
            .map((page) => new Container(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(page.avatar())),
                    title: Text(page.title),
                    onTap: () => navigate(context, page.widget),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                ))
            .toList(),
      ),
    );
  }

  List<Page> pages() {
    return [
      Page("Silver AppBar With ToolBar", SilverAppBarWithTabBarScreen()),
      Page("Bottom Nav Icon Size", BottomNavIconSize()),
      Page("Network Example", NetworkExampleScreen()),
    ];
  }
}
