import 'dart:async';

import 'package:flutter/services.dart';

class ZrFlutterNativeBridge {
  static const MethodChannel _channel =
      const MethodChannel('zr_flutter_native_bridge');

  ZrFlutterNativeBridge(){
    _channel.setMethodCallHandler(_onMethodCall);
  }
  Future<String> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'saveData':
        String key = call.arguments['strKey'];
        String value = call.arguments['strValue'];
        return "ddd";
      case 'loadData':
        return "loadData";
    }
    throw MissingPluginException(
        '${call.method} was invoked but has no handler');
  }



  static Future<String> get platformVersion async {
    
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> startSDK(String classPath, String methodName, String params) async{
    return _channel.invokeMethod<String>('startSDK',[classPath, methodName, params]).then<String>((dynamic result) => result);
  }


  
}
