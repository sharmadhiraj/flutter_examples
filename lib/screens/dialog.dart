import 'package:flutter/material.dart';

class DialogExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bodyProgress = new Container(
      decoration: new BoxDecoration(
          color: Colors.blue[200],
          borderRadius: new BorderRadius.circular(2.0)),
      width: 300.0,
      height: 200.0,
//color: Colors.blue,
      alignment: AlignmentDirectional.center,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new SizedBox(
              height: 50.0,
              width: 50.0,
              child: new CircularProgressIndicator(
                value: null,
                strokeWidth: 7.0,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 25.0),
            child: new Center(
              child: new Text(
                "Signing up...",
                style: new TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Dialog")),
      body: Center(
        child: RaisedButton(
          child: Text("Show"),
          onPressed: () {
            showDialog(
                context: context,
                child: new AlertDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  content: bodyProgress,
                ));
          },
        ),
      ),
    );
  }
}
