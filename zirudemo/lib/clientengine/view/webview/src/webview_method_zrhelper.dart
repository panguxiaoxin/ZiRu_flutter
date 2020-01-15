import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

class WebviewMethodZrhelper {
  static Future<String> handMethodCall(MethodCall call) async {
    switch (call.arguments['zrMethod']) {
      case 'saveData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        final String strValue = params['strValue'];
        bool reslut = await ClientEngine().saveData(strKey, strValue);
        return reslut ? "1" : "0";
      case 'loadData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        String data = await ClientEngine().loadData(strKey);
        return data;
      case 'deleteData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        bool reslut = await ClientEngine().deleteData(strKey);
        return reslut ? "1" : "0";
      case 'setShareData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        final String strValue = params['strValue'];
        bool reslut = ClientEngine().setSharedData(strKey, strValue);
        return reslut ? "1" : "0";
      case 'getShareData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        String data = ClientEngine().getSharedData(strKey);
        return data;
      case 'deleteShareData':
        var params = jsonDecode(call.arguments['params']);
        final String strKey = params['strKey'];
        bool reslut = ClientEngine().deleteSharedData(strKey);
        return reslut ? "1" : "0";
      default:
        return "";
    }
  }
}
