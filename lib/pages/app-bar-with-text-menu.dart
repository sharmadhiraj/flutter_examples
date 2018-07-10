import 'package:flutter/material.dart';

class AppBarWithTextMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Title"),
        actions: <Widget>[
          new Container(),
          Center(
            child: new Text(
              "User name",
              textScaleFactor: 1.5,
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ),
          new IconButton(
            icon: new Icon(Icons.close),
            tooltip: 'Closes application',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
