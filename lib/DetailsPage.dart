import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage(this.url);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
