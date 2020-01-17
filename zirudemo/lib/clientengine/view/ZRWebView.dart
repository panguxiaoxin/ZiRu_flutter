import 'package:flutter/material.dart';

import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/view/webview/webview_flutter.dart';

import '../WebEngine.dart';

class ZRWebView extends StatefulWidget {
  final String strUrl;
  PageFinishListener listener;
  ZRWebView(this.strUrl);
  WebView webView;

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
        name: 'clientJsEngine',
        onMessageReceived: (JavascriptMessage message) {
          String data = message.message;
          WebEngine.handMessage(context, _controller, data);
        });
  }

  callbackJs(String javascriptString) {
    if (_controller != null) {
      _controller.evaluateJavascript(javascriptString);
    }
  }

  bool isInit = false;

  WebView getWebView() {
    if (widget.webView == null) {
      widget.webView = WebView(
        initialUrl: "file://" + widget.strUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        navigationDelegate: (NavigationRequest request) {
          print(' navigation to $request');
          return NavigationDecision.navigate;
        },
        debuggingEnabled: true,
        javascriptChannels: <JavascriptChannel>[
          _engineJavascriptChannel(context),
        ].toSet(),
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (String url) {
          if (!isInit) {
            callbackJs("clientEngine.onClientFormLoaded();");
            callbackJs("clientEngine.onClientFormFocused();");
            isInit = true;
          }

          print('Page finished loading: $url');
          if (widget.listener != null) {
            widget.listener.callBack(widget);
            widget.listener = null;
          }
        },
      );
    }
    ;
    return widget.webView;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
<<<<<<< HEAD

    return getWebView();
=======
    return WebView(
      initialUrl: "file://" + widget.strUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
      navigationDelegate: (NavigationRequest request) {
        // print(' navigation to $request');
        return NavigationDecision.navigate;
      },
      debuggingEnabled: true,
      javascriptChannels: <JavascriptChannel>[
        _engineJavascriptChannel(context),
      ].toSet(),
      onPageStarted: (String url) {
        // print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        // print('Page finished loading: $url');
        if (widget.listener != null) {
          widget.listener.callBack(widget);
          widget.listener = null;
        }
      },
    );
>>>>>>> 38719b847054488ab06a75acbe8d3881a44822d0
  }
}
