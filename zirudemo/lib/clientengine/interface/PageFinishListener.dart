import 'package:webview_flutter/webview_flutter.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';

abstract class PageFinishListener {
  void callBack(ZRWebView zrWebView);

  void buildCallBack(ZRWebView zrWebView);
}
