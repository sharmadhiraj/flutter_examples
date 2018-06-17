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
            iconSize: 30.0, //Nothing happens when I change this

            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  title: Text(
                    'Cloud',
                    style: TextStyle(fontSize: 22.0),
                  ),
                  icon: Icon(
                    Icons.cloud,
                    color: Colors.red,
                  )),
              BottomNavigationBarItem(
                  title: Text('Cloud'), icon: Icon(Icons.cloud)),
// Other items left out as they are almost clones of the above
            ]));
  }
}
