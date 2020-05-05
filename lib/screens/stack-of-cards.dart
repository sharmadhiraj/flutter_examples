import 'package:flutter/material.dart';

class CardStackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Stack")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Card(
                  child: null,
                ),
                Card(
                  child: Text("Content"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
