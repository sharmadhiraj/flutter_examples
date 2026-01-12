import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewInFlutter extends StatefulWidget {
  const WebViewInFlutter({super.key});

  @override
  State<WebViewInFlutter> createState() => _WebViewInFlutterState();
}

class _WebViewInFlutterState extends State<WebViewInFlutter> {
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
        final NavigatorState navigator = Navigator.of(context);
        if (await _controller.canGoBack()) {
          _controller.goBack();
        } else {
          if (!mounted) return;
          navigator.pop(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              final NavigatorState navigator = Navigator.of(context);
              if (await _controller.canGoBack()) {
                _controller.goBack();
              } else {
                if (!mounted) return;
                navigator.pop();
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
