import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://www.bbc.com/sport/football/45113124",
      appBar: new AppBar(
        actions: <Widget>[
          Container(
            child: RaisedButton(
              child: Text("Open In Browser"),
              onPressed: () {},
            ),
            margin: EdgeInsets.only(right: 10.0),
          )
        ],
      ),
    );
  }
}
