import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:zirudemo/ZRConstants.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';
import 'package:zirudemo/clientengine/view/webview/webview_flutter.dart';

class WebEngine {
  static handMessage(
      BuildContext context, WebViewController controller, String data) {
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
    } else if (method == "openform") {
      clientEngine.openform(context, params["url"], params["strTitle"],
          params["strData"], params["nOpenMode"], params["nAnimation"]);
    } else if (method == "back") {
      clientEngine.back(context, params["nAnimation"]);
    }
  }
}
