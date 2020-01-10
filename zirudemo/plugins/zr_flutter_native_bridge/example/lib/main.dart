import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:zr_flutter_native_bridge/zr_flutter_native_bridge.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // platformVersion = await ZrFlutterNativeBridge.platformVersion;
      ZrFlutterNativeBridge();
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      // _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app1111'),
        ),
        body: Center(
          child: GestureDetector(
            child: Text("点击此调用原生插件 = $_platformVersion"),
            onTap: () {
              ZrFlutterNativeBridge.startSDK("DFBaiduSDK", "showUserId", "hahaha")
                                   .then((result) {
                                    print("异步获得的数据 = $result");
                                    _platformVersion = result;
                                    setState((){});
                                    
              });
            },
          ),
        ),
      ),
    );
  }
}
