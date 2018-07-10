import 'package:flutter/material.dart';

class AlertDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog")),
      body: Center(
          child: RaisedButton(
              onPressed: () => _showAlert(context),
              child: Text("Alert Dialog"))),
    );
  }

  void _showAlert(BuildContext context) {
    Dialog dialog = new Dialog(
      child: new Container(
        width: 260.0,
        height: 230.0,
        decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red,
          borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            new Expanded(
              child: new Row(
                children: <Widget>[
                  new Container(
                    // padding: new EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                    ),
                    child: new Text(
                      'Rate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            new Expanded(
              child: new Container(
                  child: new TextField(
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  contentPadding: new EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
                  hintText: ' add review',
                  hintStyle: new TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                ),
              )),
              flex: 2,
            ),

            // dialog bottom
            new Expanded(
              child: new Container(
                padding: new EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  color: const Color(0xFF33b17c),
                ),
                child: new Text(
                  'Rate product',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontFamily: 'helvetica_neue_light',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    showDialog(context: context, child: dialog);
  }
}
