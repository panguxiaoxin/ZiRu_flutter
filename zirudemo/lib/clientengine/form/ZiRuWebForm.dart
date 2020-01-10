import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';
import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';
import 'package:zirudemo/manager/FormListManager.dart';

class ZiRuWebForm extends StatefulWidget {
  final String _strOrginUrl;
  final String _strUrl;
  final String _strTitle;
  final String _strData;
  final int _nOpenMode;
  int _nAnimation;

  ZRWebView preInitWebView;

  ZRWebView currentWebView;
  ZiRuWebForm(this._strOrginUrl, this._strUrl, this._strTitle, this._strData,
      this._nOpenMode, this._nAnimation);

  @override
  State<StatefulWidget> createState() {
    MyWebFormState state = new MyWebFormState();
    ZRFormState formState = new ZRFormState();
    formState.ziRuWebForm = this;
    formState.zrState = state;
    FormListManager.getInstance().add(formState);
    return state;
  }
}

class MyWebFormState extends State<ZiRuWebForm> {
  bool isInitView = false;
  PageFinishListener mfinishListener;
  WidgetsBinding widgetsBinding;
  @override
  void initState() {
    super.initState();
  }

  initPreWebView(bool isInit, PageFinishListener finishListener) {
    setState(() {
      print("initPreWebView===isInit=====");
      isInitView = isInit;
      mfinishListener = finishListener;
      if (mfinishListener != null) {
        print("initPreWebView===11111=====");
        widgetsBinding = WidgetsBinding.instance;
        widgetsBinding.addPostFrameCallback((callback) {
          print("initPreWebView===22222=====");
          mfinishListener.buildCallBack(widget.preInitWebView);
          mfinishListener = null;
          widget.preInitWebView = null;
        });
      }
    });
  }

  Future<bool> _back() {
    widget.currentWebView.zrState.callbackJs("onClientBackPressed();");

    return new Future.value(false);
  }

  BuildContext mcontext;
  @override
  Widget build(BuildContext context) {
    mcontext = context;
    if (widget.currentWebView == null) {
      widget.currentWebView = ZRWebView(widget._strUrl);
    }

    return WillPopScope(
        onWillPop: _back,
        child: Stack(
          children: <Widget>[
            isInitView ? widget.preInitWebView : Container(),
            widget.currentWebView,
          ],
        ));
  }
}
