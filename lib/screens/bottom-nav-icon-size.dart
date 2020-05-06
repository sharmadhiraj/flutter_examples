import 'package:flutter/material.dart';

class BottomNavIconSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nav Icon Size")),
      body: Center(
        child: Text(""),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        iconSize: 24,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text(
                'Cloud',
                style: TextStyle(fontSize: 22),
              ),
              icon: Icon(
                Icons.cloud,
                color: Colors.red,
              )),
          BottomNavigationBarItem(
              title: Text('Cloud'), icon: Icon(Icons.cloud)),
        ],
      ),
    );
  }
}
