import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String url = "https://www.google.com/";

    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        actions: <Widget>[
          Container(
            child: ElevatedButton(
              child: Text("Open In Browser"),
              onPressed: () => launchUrl(Uri.parse(url)),
            ),
            margin: EdgeInsets.only(right: 10),
          )
        ],
      ),
    );
  }
}
