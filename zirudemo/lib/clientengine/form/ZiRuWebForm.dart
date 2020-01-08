import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

class ZiRuWebForm extends StatefulWidget{
      
    final String _strOrginUrl;
     final String _strUrl;
    final String _strTitle;
    final String _strData;
    final int _nOpenMode;
    final int _nAnimation;
    final ClientEngine _clientEngine;
   ZiRuWebForm(this._strOrginUrl,this._strUrl,this._strTitle,this._strData,this._nOpenMode,this._nAnimation,this._clientEngine);
  @override
  State<StatefulWidget> createState() {
  
    return new MyWebFormState();
  }

  
}

class  MyWebFormState extends State<ZiRuWebForm> {
  WebViewController _controller ;
      

  @override
  void initState() {
    super.initState();
  
  }

  JavascriptChannel _engineJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'clientEngine',
        onMessageReceived: (JavascriptMessage message) {
         String data=message.message;
       
         var map=jsonDecode(data);
            String  method=map["method"];
            var  params=map["params"];
            if(method=="saveData"){
             widget._clientEngine.saveData(params["key"], params["value"]);
            }else if(method=="shareData"){
           widget._clientEngine.setSharedData(params["key"], params["value"]);
            }else if(method=="loadData"){
                var  callback=params["callback"];
                var result=widget._clientEngine.loadData(params["key"]);
                 String jsdata=callback+"('"+result+"');";
                 _controller.evaluateJavascript(jsdata);
            }else if(method=="shareData"){
               var  callback=params["callback"];
                var result=widget._clientEngine.getSharedData(params["key"]);
                String jsdata=callback+"("+result+");";
               _controller.evaluateJavascript(jsdata);
            }
            
        });
  }
  @override
  Widget build(BuildContext context) {
    


    return WebView(
     initialUrl: "file://"+widget._strUrl,
      javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
           _controller=webViewController;
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
          },
  
    );

    
  }
    
  }
