import 'package:flutter/material.dart';

class ColorUtilsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Color Utils")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 24,
              width: double.infinity,
              color: hexToColor("FF0000"),
            )
          ],
        ),
      ),
    );
  }

  ThemeData colorToThemeData() {
    return ThemeData(primarySwatch: colorToMaterialColor(Colors.green));
  }

  MaterialColor colorToMaterialColor(Color color) {
    return MaterialColor(color.value, colorToSwatch(color));
  }

  Map<int, Color> colorToSwatch(Color color) {
    return {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1),
    };
  }

  Color hexToColor(String hexCode) {
    hexCode = hexCode.replaceAll("#", "");
    try {
      return Color(int.parse("FF$hexCode", radix: 16));
    } catch (e) {
      return Colors.blue;
    }
  }
}
