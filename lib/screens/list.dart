import 'package:flutter/material.dart';
import 'package:flutter_examples/Screens/location/location.dart';
import 'package:flutter_examples/Screens/refresh_indicator.dart';
import 'package:flutter_examples/Screens/test-state.dart';
import 'package:flutter_examples/Screens/user-info.dart';
import 'package:flutter_examples/Screens/webview-example.dart';
import 'package:flutter_examples/Screens/webview_back.dart';
import 'package:flutter_examples/screens/snackbar-dialog.dart';

import '../model/screen.dart';
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
        children: screens()
            .reversed
            .toList()
            .map((screen) => new Container(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(screen.avatar())),
                    title: Text(screen.title),
                    onTap: () => navigate(context, screen.widget),
                  ),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                ))
            .toList(),
      ),
    );
  }

  List<Screen> screens() {
    return [
      Screen("Silver AppBar With TabBar", SilverAppBarWithTabBarScreen()),
      Screen("Bottom Nav Icon Size", BottomNavIconSize()),
      Screen("Network Example", NetworkExampleScreen()),
      Screen("Dialog Example", DialogExampleScreen()),
      Screen("Weather Example", WeatherScreen()),
      Screen("Alert Dialog Example", AlertDialogScreen()),
      Screen("Posts", FirstFragment("", "")),
      Screen("DropDown Button", DropDownButtonScreen()),
      Screen("Appbar with text menu", AppBarWithTextMenuScreen()),
      Screen("Card Stacks", CardStackScreen()),
      Screen("FAB Example", FabExampleScreen()),
      Screen("Grid Example", GridViewScreen()),
      Screen("Expansion Tiles Example", ExpansionTilesExample()),
      Screen("Time Tracker", TimeTrackHome(title: "Time Tracker")),
      Screen("SnackBar Dialog", SnackBarScreen()),
      Screen("Test State", TestStateLessScreen()),
      Screen("Web View Example", WebViewScreen()),
      Screen("Pull To Refresh Example", SwipeToRefreshExample()),
      Screen("Location", LocationScreen()),
      Screen("User Info", UserInfoScreen()),
      Screen("WebView With Back", WebviewInFlutter()),
    ];
  }
}
