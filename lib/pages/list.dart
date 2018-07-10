import 'package:flutter/material.dart';

import '../model/page.dart';
import '../util/data.dart';
import '../util/method.dart';
import 'alert-dialog.dart';
import 'app-bar-with-text-menu.dart';
import 'bottom-nav-icon-size.dart';
import 'dialog.dart';
import 'dropdown-button-navigation.dart';
import 'fab.dart';
import 'grid-view.dart';
import 'network-example.dart';
import 'posts.dart';
import 'silver-appbar-with-tabbar.dart';
import 'stack-of-cards.dart';
import 'weather.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: ListView(
        children: pages()
            .reversed
            .toList()
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
      Page("Dialog Example", DialogExampleScreen()),
      Page("Weather Example", WeatherScreen()),
      Page("Alert Dialog Example", AlertDialogScreen()),
      Page("Posts", FirstFragment("", "")),
      Page("DropDown Button", DropDownButtonScreen()),
      Page("Appbar with text menu", AppBarWithTextMenuScreen()),
      Page("Card Stacks", CardStackScreen()),
      Page("FAB Example", FabExampleScreen()),
      Page("Grid Example", GridViewScreen()),
    ];
  }
}
