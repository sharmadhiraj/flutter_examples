import 'package:flutter/material.dart';

class FabExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAB Example")),
      body: Center(child: Text("FAB")),
      floatingActionButton: new FloatingActionButton(
          heroTag: null,
          child: new Container(
              alignment: Alignment.center, child: new Icon(Icons.adb)),
          onPressed: () {
            print("FAB");
          }),
    );
  }
}
