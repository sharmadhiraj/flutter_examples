import 'package:flutter/material.dart';

class AlertDialogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Dialog")),
      body: Center(
          child: RaisedButton(
              onPressed: () => _showAlert(context),
              child: Text("Show Alert Dialog"))),
    );
  }

  void _showAlert(BuildContext context) {
    Dialog dialog = Dialog(
      child: Container(
        width: 260,
        height: 230,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // dialog top
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      'Rate',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'helvetica_neue_light',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // dialog centre
            Expanded(
              child: Container(
                  child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: false,
                  contentPadding: EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10),
                  hintText: ' add review',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                    fontFamily: 'helvetica_neue_light',
                  ),
                ),
              )),
              flex: 2,
            ),

            // dialog bottom
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF33b17c),
                ),
                child: Text(
                  'Rate product',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
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
