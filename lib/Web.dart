import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Web extends StatefulWidget {
  String url;

  Web(this.url);

  @override
  _WebState createState() => _WebState(url);
}

class _WebState extends State<Web> {
  String url;

  _WebState(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News"),),
      body: WebView(
        initialUrl:(url!=null &&url.contains("http"))?url:"https://www.google.com" ,
        javascriptMode: JavascriptMode.unrestricted,
      ),

    );
  }
}
