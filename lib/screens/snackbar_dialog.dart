import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SnackBar Example")),
      body: Center(
        child: Builder(builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Hello there"),
              ),
            ),
            child: Text('Show'),
          );
        }),
      ),
    );
  }
}
