import 'package:flutter/material.dart';

class BottomNavIconSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nav Icon Size")),
      body: Center(child: Text("Bottom Nav Icon Size")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 24,
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
