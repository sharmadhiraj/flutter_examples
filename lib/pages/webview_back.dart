import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewInFlutter extends StatefulWidget {
  WebviewInFlutter({Key key}) : super(key: key);

  @override
  _WebviewInFlutterState createState() => _WebviewInFlutterState();
}

class _WebviewInFlutterState extends State<WebviewInFlutter> {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {

    return WebviewScaffold(
      url: 'https://google.com',
      hidden: true,
      appCacheEnabled: true,
      withJavascript: true,
      withLocalStorage: true,
      appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                flutterWebviewPlugin.canGoBack().then((value) {
                  if (value) {
                    flutterWebviewPlugin.goBack();
                  } else {
                    Navigator.pop(context);
                  }
                });
              }),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              onPressed: () => flutterWebviewPlugin
                  .reload(), // this is reloading the url that was provided to webview, not the current URL.
            )
          ],
          elevation: 1.0,
          centerTitle: true,
          title: Text("Google Mobile")),
    );
  }
}
