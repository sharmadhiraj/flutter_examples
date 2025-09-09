import 'package:flutter/material.dart';

class BottomNavIconSize extends StatelessWidget {
  const BottomNavIconSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nav Icon Size")),
      body: Center(child: Text("Bottom Nav Icon Size")),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 22,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Cloud',
            icon: Icon(
              Icons.cloud,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cloud',
            icon: Icon(Icons.cloud),
          ),
        ],
      ),
    );
  }
}
