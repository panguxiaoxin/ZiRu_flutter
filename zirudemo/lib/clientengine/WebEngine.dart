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
    Map<String, dynamic> params = map["params"];

    
    if (method == "openform") {
      var url = ZRConstants.zipPath + params["url"];
      clientEngine.openform(context, params["url"], url, "", 1, 1);
    } else if (method == "back") {
      clientEngine.back(context, params["nAnimation"]);
    }else if (method == "raiseTrans") {

      // clientEngine.raiseHttpGet(params["strUrl"]).then((result){
      //   controller.evaluateJavascript(javascriptString)
      // });

    }else if (method == "raiseHttpGet") {
      
      final strCallbackFunction = params['strCallbackFunction'];
      final strUrl = params['strUrl'];
      final strAttachData = params['strAttachData'];

      clientEngine.raiseHttpGet(strUrl).then((result){
        
        var resultString = "'$strCallbackFunction','$strUrl','200','$result','$strAttachData'";
        try {
          controller.evaluateJavascript("onHttpResult($resultString)");
        } catch (e) {

        }
        
      });
    }else if (method == "raiseHttpPost") {

      final strCallbackFunction = params['strCallbackFunction'];
      final strUrl = params['strUrl'];
      final strContentType = params['strContentType'];
      final strData = params['strData'];
      final strAttachData = params['strAttachData'];

      clientEngine.raiseHttpPost(strUrl, strContentType, strData).then((result){

        var resultString = "'$strCallbackFunction','$strUrl','200','$result','$strAttachData'";
        try {
          controller.evaluateJavascript("onHttpResult($resultString)");
        } catch (e) {
          
        }

      });
    }
  }
}
