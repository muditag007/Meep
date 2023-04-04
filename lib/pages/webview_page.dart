// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    super.key,
    required this.html,
  });
  static String id = 'webviewpage';
  final String html;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;
//   String kExamplePage = '''
// <!DOCTYPE html>
// <html lang="en">
// <head>
// <title>Load file or HTML string example</title>
// </head>
// <body>

// <h1>Local demo page</h1>
// <p>
//  This is an example page used to demonstrate how to load a local file or HTML
//  string using the <a href="https://pub.dev/packages/webview_flutter">Flutter
//  webview</a> plugin.
// </p>

// </body>
// </html>
// ''';
  String kExamplePage = "";

  @override
  void initState() {
    super.initState();
    kExamplePage = widget.html.toString();
    print(kExamplePage);
    controller = WebViewController()
      ..setUserAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36")
      // ..loadRequest(
      //   Uri.parse('https://flutter.dev'),
      // );
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(kExamplePage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
