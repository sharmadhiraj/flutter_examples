import 'package:flutter/material.dart';

class FabExampleScreen extends StatelessWidget {
  const FabExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Button Example")),
      body: Center(child: Text("Floating Action Button Example")),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            child: Container(
              alignment: Alignment.center,
              child: Icon(Icons.adb),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Hello Floating Action Button!')),
              );
            },
          );
        },
      ),
    );
  }
}
