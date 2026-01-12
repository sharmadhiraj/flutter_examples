import 'package:flutter/material.dart';

class SnackBarScreen extends StatelessWidget {
  const SnackBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SnackBar Example")),
      body: Center(
        child: Builder(builder: (BuildContext context) {
          return ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Hello there"),
              ),
            ),
            child: const Text('Show'),
          );
        }),
      ),
    );
  }
}
