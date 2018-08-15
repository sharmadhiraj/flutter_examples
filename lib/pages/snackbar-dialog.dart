import 'package:flutter/material.dart';

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Snackbar text'),
            action: SnackBarAction(
              label: 'Ok',
              onPressed: () {
                // Alert Dialog
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show'),
      ),
    );
  }
}
