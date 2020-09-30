import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String message = "Hello";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reload State On Resume")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                message,
                style: TextStyle(fontSize: 16),
              ),
            ),
            RaisedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ).then((value) =>
                  setState(() => message = DateTime.now().toIso8601String())),
              child: Text("Go To Next Screen"),
            )
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Go Back"),
        ),
      ),
    );
  }
}
