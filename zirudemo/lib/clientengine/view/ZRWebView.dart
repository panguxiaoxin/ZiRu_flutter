import 'package:flutter/material.dart';

import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/view/webview/webview_flutter.dart';

import '../WebEngine.dart';

class ZRWebView extends StatefulWidget {
  final String strUrl;
  PageFinishListener listener;
  ZRWebView(this.strUrl);
  WebView webView;
  bool isinited = false;

  ZRState zrState;
  State<StatefulWidget> createState() {
    zrState = new ZRState();
    return zrState;
  }
}

class ZRState extends State<ZRWebView> {
  WebViewController _controller;

  JavascriptChannel _engineJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'clientEngine',
        onMessageReceived: (JavascriptMessage message) {
          String data = message.message;
          WebEngine.handMessage(context, _controller, data);
        });
  }

  callbackJs(String javascriptString) {
    _controller.evaluateJavascript(javascriptString);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebView(
      initialUrl: "file://" + widget.strUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
      navigationDelegate: (NavigationRequest request) {
        print(' navigation to $request');
        if (widget.isinited) {
          return NavigationDecision.prevent;
        } else {
          widget.isinited = true;
          print('allowing navigation to $request');
          return NavigationDecision.navigate;
        }
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
        if (widget.listener != null) {
          widget.listener.callBack(widget);
          widget.listener = null;
        }
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   if (widget.webView == null) {
  //     print("webView====2222");
  //     widget.webView = WebView(
  //       initialUrl: "file://" + widget.strUrl,
  //       javascriptMode: JavascriptMode.unrestricted,
  //       onWebViewCreated: (WebViewController webViewController) {
  //         _controller = webViewController;
  //       },
  //       navigationDelegate: (NavigationRequest request) {
  //         print(' navigation to $request');
  //         if (widget.isinited) {
  //           return NavigationDecision.prevent;
  //         } else {
  //           widget.isinited = true;
  //           print('allowing navigation to $request');
  //           return NavigationDecision.navigate;
  //         }
  //       },
  //       debuggingEnabled: true,
  //       javascriptChannels: <JavascriptChannel>[
  //         _engineJavascriptChannel(context),
  //       ].toSet(),
  //       onPageStarted: (String url) {
  //         print('Page started loading: $url');
  //       },
  //       onPageFinished: (String url) {
  //         print('Page finished loading: $url');
  //         if (widget.listener != null) {
  //           widget.listener.callBack(widget);
  //           widget.listener = null;
  //         }
  //       },
  //     );
  //   } else {}

  //   return widget.webView;
  // }
}
