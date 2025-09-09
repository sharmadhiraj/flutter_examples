import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewInFlutter extends StatefulWidget {
  const WebviewInFlutter({Key? key}) : super(key: key);

  @override
  _WebviewInFlutterState createState() => _WebviewInFlutterState();
}

class _WebviewInFlutterState extends State<WebviewInFlutter> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://google.com'));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _controller.canGoBack()) {
          _controller.goBack();
        } else {
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => _controller.reload(),
            ),
          ],
          centerTitle: true,
          title: const Text("Google Mobile"),
        ),
        body: WebViewWidget(controller: _controller),
      ),
    );
  }
}
