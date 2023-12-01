import 'package:flutter/material.dart';

class AppBarWithTextMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
        actions: <Widget>[
          Container(),
          Center(
            child: Text(
              "User name",
              textScaler: TextScaler.linear(1.5),
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            tooltip: 'Closes application',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
