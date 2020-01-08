import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

class WebEngine {
  static handMessage(WebViewController controller, String data) {
    ClientEngine clientEngine = ClientEngine();
    var map = jsonDecode(data);
    String method = map["method"];
    var params = map["params"];
    if (method == "saveData") {
      clientEngine.saveData(params["key"], params["value"]);
    } else if (method == "setShareData") {
      clientEngine.setSharedData(params["key"], params["value"]);
    } else if (method == "loadData") {
      var callback = params["callback"];
      var result = clientEngine.loadData(params["key"]);
      String jsdata = callback + "('" + result + "');";
      controller.evaluateJavascript(jsdata);
    } else if (method == "getshareData") {
      var callback = params["callback"];
      var result = clientEngine.getSharedData(params["key"]);
      String jsdata = callback + "(" + result + ");";
      controller.evaluateJavascript(jsdata);
    }
  }
}
