import 'package:flutter/material.dart';

class FabExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Button Example")),
      body: Center(child: Text("Floating Action Button Example")),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
            child:
                Container(alignment: Alignment.center, child: Icon(Icons.adb)),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: new Text('Hello Floating Action Button!')));
            });
      }),
    );
  }
}