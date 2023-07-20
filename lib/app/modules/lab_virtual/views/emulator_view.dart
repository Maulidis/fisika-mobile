import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmulatorScreen extends StatelessWidget {
  final String url;

  const EmulatorScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
