import 'package:flutter/material.dart';
import 'package:flutter_examples/screens/color_utils.dart';
import 'package:flutter_examples/screens/custom_appbar_theme.dart';
import 'package:flutter_examples/screens/dynamic_key_json.dart';
import 'package:flutter_examples/screens/save_custom_object.dart';
import 'package:flutter_examples/screens/splash.dart';

import 'model/screen.dart';
import 'screens/alert_dialog.dart';
import 'screens/app_bar_with_text_menu.dart';
import 'screens/bottom_nav_icon_size.dart';
import 'screens/dialog.dart';
import 'screens/dropdown_button_navigation.dart';
import 'screens/expansion_tiles.dart';
import 'screens/fab.dart';
import 'screens/grid_view.dart';
import 'screens/list_detail_example.dart';
import 'screens/location.dart';
import 'screens/multiple_network_requests.dart';
import 'screens/network_example.dart';
import 'screens/posts.dart';
import 'screens/pull_to_refresh.dart';
import 'screens/reload_state_on_resume.dart';
import 'screens/silver_appbar_with_tabbar.dart';
import 'screens/snackbar_dialog.dart';
import 'screens/stack_of_cards.dart';
import 'screens/weather.dart';
import 'screens/webview_back.dart';
import 'screens/webview_example.dart';
import 'util/data.dart';
import 'util/method.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName)),
      body: ListView(
        children: getScreens()
            .map((screen) => Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(screen.avatar())),
                    title: Text(
                      screen.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
    final List<Screen> screens = [
      Screen(
        "Silver AppBar With Tabbar",
        "Working example of Silver AppBar with Tabbar",
        const SilverAppBarWithTabBarScreen(),
      ),
      Screen(
        "Bottom Nav Icon Size",
        "Working example of customized size of BottomNaviagationBar icon size",
        const BottomNavIconSize(),
      ),
      Screen(
        "Network Call Example",
        "Simple example of network call with progress, error, retry & reload",
        const NetworkExampleScreen(),
      ),
      Screen(
        "Dialog Example",
        "Display custom dialog on button click",
        const DialogExampleScreen(),
      ),
      Screen(
        "Weather Example",
        "Parse custom Json example",
        const WeatherScreen(),
      ),
      Screen(
        "Alert Dialog Example",
        "Display alert dialog on button click",
        const AlertDialogScreen(),
      ),
      Screen(
        "Network Call On Button Click",
        "Example of network request on button click",
        const NetworkCall(),
      ),
      Screen(
        "DropDown Button",
        "Dropdown on AppBar",
        const DropDownButtonScreen(),
      ),
      Screen(
        "AppBar With Text Menu",
        "Example of text on AppBar menu",
        const AppBarWithTextMenuScreen(),
      ),
      Screen(
        "Card Stacks",
        "Stack of cards using Stack Widget",
        const CardStackScreen(),
      ),
      Screen(
        "Floating Action Button Example",
        "Floating Action Button with show SnackBar on press",
        const FabExampleScreen(),
      ),
      Screen(
        "Grid View",
        "Grid View Example on Flutter",
        const GridViewScreen(),
      ),
      Screen(
        "Expansion Tiles Example",
        "Multilevel Expansion Tiles",
        const ExpansionTilesExample(),
      ),
      Screen(
        "SnackBar Dialog",
        "Show SnackBar on button press",
        const SnackBarScreen(),
      ),
      Screen(
        "List Detail Example",
        "Example of navigation from list to detail screen",
        const ListExampleScreen(),
      ),
      Screen(
        "Web View Example",
        "Example of WebView with open in external browser option",
        const WebViewScreen(),
      ),
      Screen(
        "Pull To Refresh Example",
        "",
        const SwipeToRefreshExample(),
      ),
      Screen(
        "Location",
        "Get user's current location in Flutter",
        const LocationScreen(),
      ),
      Screen(
        "WebView With Back",
        "WebView with back button associated with history of page loaded.",
        const WebviewInFlutter(),
      ),
      Screen(
        "Reload State On Resume",
        "Event on first screen when user navigates back to first screen from second screen.",
        const FirstScreen(),
      ),
      Screen(
        "Multiple Network Request",
        "Combining multiple network request in Flutter to single Future and FutureBuilder.",
        const NewsDashboard(),
      ),
      Screen(
        "Splash Screen",
        "Example of Splash Screen",
        const SplashScreen(),
      ),
      Screen(
        "Dynamic Key Json",
        "Parse Json data with dynamic keys",
        const DynamicKeyJsonExampleScreen(),
      ),
      Screen(
        "Color Utils",
        "Color utility methods like create color from hex code, convert color to material color, convert color to theme. This can be useful to create theme for app with single color or hex code.",
        const ColorUtilsScreen(),
      ),
      Screen(
        "Custom AppBar Theme",
        "AppBar with custom theme color. This can be useful to create different screen with different theme.",
        const CustomAppBarThemeExample(),
      ),
      Screen(
        "Save Custom Object",
        "Save Custom Object to Shared Preferences.",
        const SaveCustomObjectExampleScreen(),
      ),
    ]..sort((a, b) => a.title.compareTo(b.title));
    return screens;
  }
}
