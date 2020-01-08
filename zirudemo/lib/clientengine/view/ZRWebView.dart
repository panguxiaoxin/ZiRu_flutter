import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

import '../WebEngine.dart';

class ZRWebView extends StatefulWidget {
  final String strUrl;
  ZRWebView({Key key, this.strUrl}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new ZRState();
  }
}

class ZRState extends State<ZRWebView> {
  WebViewController _controller;

  JavascriptChannel _engineJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'clientEngine',
        onMessageReceived: (JavascriptMessage message) {
          String data = message.message;
          WebEngine.handMessage(_controller, data);
        });
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: "file://" + widget.strUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
      debuggingEnabled: true,
      javascriptChannels: <JavascriptChannel>[
        _engineJavascriptChannel(context),
      ].toSet(),
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
    );
  }
}
