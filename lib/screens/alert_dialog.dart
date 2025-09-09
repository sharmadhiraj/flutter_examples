import 'package:flutter/material.dart';
import 'package:flutter_examples/util/data.dart';

class AlertDialogScreen extends StatelessWidget {
  const AlertDialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showAlert(context),
          child: Text("Show Alert Dialog"),
        ),
      ),
    );
  }

  Future<void> _showAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text(appName),
        content: Text("Example of simple alert dialog"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
