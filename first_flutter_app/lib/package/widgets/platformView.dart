import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformViewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("platformView 实例"),
      ),
      body: WebView(
        initialUrl: "https://flutterchina.club",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}