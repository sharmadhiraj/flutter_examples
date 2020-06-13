import 'package:flutter/material.dart';
import 'package:flutter_examples/screens/color_utils.dart';
import 'package:flutter_examples/screens/custom_appbar_theme.dart';
import 'package:flutter_examples/screens/dynamic_key_josn.dart';
import 'package:flutter_examples/screens/splash.dart';

import 'model/screen.dart';
import 'screens/alert-dialog.dart';
import 'screens/app-bar-with-text-menu.dart';
import 'screens/bottom-nav-icon-size.dart';
import 'screens/dialog.dart';
import 'screens/dropdown-button-navigation.dart';
import 'screens/expansion-tiles.dart';
import 'screens/fab.dart';
import 'screens/grid-view.dart';
import 'screens/list-detail-example.dart';
import 'screens/location.dart';
import 'screens/multiple_network_requests.dart';
import 'screens/network-example.dart';
import 'screens/posts.dart';
import 'screens/pull_to_refresh.dart';
import 'screens/reload_state_on_resume.dart';
import 'screens/silver-appbar-with-tabbar.dart';
import 'screens/snackbar-dialog.dart';
import 'screens/stack-of-cards.dart';
import 'screens/weather.dart';
import 'screens/webview-example.dart';
import 'screens/webview_back.dart';
import 'util/data.dart';
import 'util/method.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APP_NAME)),
      body: ListView(
        children: getScreens()
            .map((screen) => Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(screen.avatar())),
                    title: Text(
                      screen.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(screen.subtitle.isEmpty
                        ? screen.title
                        : screen.subtitle),
                    onTap: () => navigate(context, screen.widget),
                  ),
                ))
            .toList(),
      ),
    );
  }

  List<Screen> getScreens() {
    List<Screen> screens = [
      Screen(
        "Silver AppBar With Tabbar",
        "Working example of Silver AppBar with Tabbar",
        SilverAppBarWithTabbarScreen(),
      ),
      Screen(
        "Bottom Nav Icon Size",
        "Working example of customized size of BottomNaviagationBar icon size",
        BottomNavIconSize(),
      ),
      Screen(
        "Network Call Example",
        "Simple example of network call with progress, error, retry & reload",
        NetworkExampleScreen(),
      ),
      Screen(
        "Dialog Example",
        "Display custom dialog on button click",
        DialogExampleScreen(),
      ),
      Screen(
        "Weather Example",
        "Parse custom Json example",
        WeatherScreen(),
      ),
      Screen(
        "Alert Dialog Example",
        "Display alert dialog on button click",
        AlertDialogScreen(),
      ),
      Screen(
        "Network Call On Button Click",
        "Example of network request on button click",
        NetworkCall(),
      ),
      Screen(
        "DropDown Button",
        "Dropdown on AppBar",
        DropDownButtonScreen(),
      ),
      Screen(
        "AppBar With Text Menu",
        "Example of text on AppBar menu",
        AppBarWithTextMenuScreen(),
      ),
      Screen(
        "Card Stacks",
        "Stack of cards using Stack Widget",
        CardStackScreen(),
      ),
      Screen(
        "Floating Action Button Example",
        "Floating Action Button with show SnackBar on press",
        FabExampleScreen(),
      ),
      Screen(
        "Grid View",
        "Grid View Example on Flutter",
        GridViewScreen(),
      ),
      Screen(
        "Expansion Tiles Example",
        "Multilevel Expansion Tiles",
        ExpansionTilesExample(),
      ),
      Screen(
        "SnackBar Dialog",
        "Show SnackBar on button press",
        SnackBarScreen(),
      ),
      Screen(
        "List Detail Example",
        "Example of navigation from list to detail screen",
        ListExampleScreen(),
      ),
      Screen(
        "Web View Example",
        "Example of WebView with open in external browser option",
        WebViewScreen(),
      ),
      Screen(
        "Pull To Refresh Example",
        "",
        SwipeToRefreshExample(),
      ),
      Screen(
        "Location",
        "Get user's current location in Flutter",
        LocationScreen(),
      ),
      Screen(
        "WebView With Back",
        "WebView with back button associated with history of page loaded.",
        WebviewInFlutter(),
      ),
      Screen(
        "Reload State On Resume",
        "Event on first screen when user navigates back to first screen from second screen.",
        FirstScreen(),
      ),
      Screen(
        "Multiple Network Request",
        "Combining multiple network request in Flutter to single Future and FutureBuilder.",
        NewsDashboard(),
      ),
      Screen(
        "Splash Screen",
        "Example of Splash Screen",
        SplashScreen(),
      ),
      Screen(
        "Dynamic Key Json",
        "Parse Json data with dynamic keys",
        DynamicKeyJsonExampleScreen(),
      ),
      Screen(
        "Color Utils",
        "Color utility methods like create color from hex code, convert color to material color, convert color to theme. This can be useful to create theme for app with single color or hex code.",
        ColorUtilsScreen(),
      ),
      Screen(
        "Custom AppBar Theme",
        "AppBar with custom theme color. This can be useful to create different screen with different theme.",
        CustomAppBarThemeExample(),
      ),
    ];
    screens.sort((a, b) => a.title.compareTo(b.title));
    return screens;
  }
}
