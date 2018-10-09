import 'package:flutter/material.dart';
import 'package:flutter_examples/pages/location/location.dart';
import 'package:flutter_examples/pages/refresh_indicator.dart';
import 'package:flutter_examples/pages/snackbar-dialog.dart';
import 'package:flutter_examples/pages/test-state.dart';
import 'package:flutter_examples/pages/webview-example.dart';

import '../model/page.dart';
import '../util/data.dart';
import '../util/method.dart';
import 'alert-dialog.dart';
import 'app-bar-with-text-menu.dart';
import 'bottom-nav-icon-size.dart';
import 'dialog.dart';
import 'dropdown-button-navigation.dart';
import 'expansion-tiles.dart';
import 'fab.dart';
import 'grid-view.dart';
import 'network-example.dart';
import 'posts.dart';
import 'silver-appbar-with-tabbar.dart';
import 'stack-of-cards.dart';
import 'time-tracking.dart';
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
      Page("Silver AppBar With TabBar", SilverAppBarWithTabBarScreen()),
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
      Page("Expansion Tiles Example", ExpansionTilesExample()),
      Page("Time Tracker", TimeTrackHome(title: "Time Tracker")),
      Page("SnackBar Dialog", SnackBarPage()),
      Page("Test State", TestStateLessScreen()),
      Page("Web View Example", WebViewScreen()),
      Page("Pull To Refresh Example", SwipeToRefreshExample()),
      Page("Location", LocationScreen()),
    ];
  }
}
