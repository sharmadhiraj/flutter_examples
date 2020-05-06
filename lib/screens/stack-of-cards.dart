import 'package:flutter/material.dart';

class CardStackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card Stack")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 20,
              child: Card(
                elevation: 8,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(width: 220, height: 300),
              ),
            ),
            Positioned(
              top: 40,
              child: Card(
                elevation: 8,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(width: 230, height: 300),
              ),
            ),
            Positioned(
              top: 60,
              child: Card(
                elevation: 8,
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(width: 240, height: 300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
