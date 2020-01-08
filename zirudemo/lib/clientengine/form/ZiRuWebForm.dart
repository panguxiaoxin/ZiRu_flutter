import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';

class ZiRuWebForm extends StatefulWidget {
  final String _strOrginUrl;
  final String _strUrl;
  final String _strTitle;
  final String _strData;
  final int _nOpenMode;
  final int _nAnimation;

  ZiRuWebForm(this._strOrginUrl, this._strUrl, this._strTitle, this._strData,
      this._nOpenMode, this._nAnimation);
  @override
  State<StatefulWidget> createState() {
    return new MyWebFormState();
  }
}

class MyWebFormState extends State<ZiRuWebForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZRWebView();
  }
}
