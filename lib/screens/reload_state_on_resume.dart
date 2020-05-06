import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatefulWidget {
  final String title;

  FirstScreen(this.title);

  @override
  _FirstScreenState createState() => _FirstScreenState(title);
}

class _FirstScreenState extends State<FirstScreen> {
  final String title;
  String message = "Hello";

  _FirstScreenState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                ).then((value) {
                  setState(() {
                    message = DateTime.now().toIso8601String();
                  });
                });
              },
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
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Go Back"),
        ),
      ),
    );
  }
}
