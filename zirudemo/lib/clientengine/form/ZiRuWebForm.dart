import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';
import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';
import 'package:zirudemo/manager/FormListManager.dart';

class ZiRuWebForm extends StatefulWidget {
  final String _strOrginUrl;
  final String strUrl;
  final String _strTitle;
  final String _strData;
  final int _nOpenMode;
  int _nAnimation;

  ZRWebView currentWebView;
  ZiRuWebForm(this._strOrginUrl, this.strUrl, this._strTitle, this._strData,
      this._nOpenMode, this._nAnimation);

  @override
  State<StatefulWidget> createState() {
    MyWebFormState state = new MyWebFormState();

    return state;
  }
}

class MyWebFormState extends State<ZiRuWebForm> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _back() {
    widget.currentWebView.zrState.callbackJs("onClientBackPressed();");
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _back,
        child: Stack(
          children: <Widget>[new ZRWebView(widget.strUrl)],
        ));
  }
}
