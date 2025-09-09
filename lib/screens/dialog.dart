import 'package:flutter/material.dart';

class DialogExampleScreen extends StatelessWidget {
  const DialogExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bodyProgress = Container(
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(2),
      ),
      width: 300,
      height: 200,
      alignment: AlignmentDirectional.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                strokeWidth: 7,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Center(
              child: Text(
                "Signing up...",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Dialog")),
      body: Center(
        child: ElevatedButton(
          child: Text("Show"),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                contentPadding: EdgeInsets.all(0),
                content: bodyProgress,
              ),
            );
          },
        ),
      ),
    );
  }
}
