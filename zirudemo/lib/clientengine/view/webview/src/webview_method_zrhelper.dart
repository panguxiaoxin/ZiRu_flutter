import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebviewMethodZrhelper {
  static Future<String> handMethodCall(MethodCall call) async {
    switch (call.arguments['zrMethod']) {
      case 'saveData':
        var params = jsonDecode(call.arguments['params']);
        final String channel = params['strKey'];
        final String message = params['strValue'];
        var share = await SharedPreferences.getInstance();
        Future<bool> b = share.setString(channel, message);
        bool bbb = await b;
        return bbb ? "1" : "0";
      case 'loadData':
        var params = jsonDecode(call.arguments['params']);
        final String channel = params['strKey'];
        var share = await SharedPreferences.getInstance();
        var data = share.getString(channel);
        return data;
      default:
        return "";
    }
  }
}
