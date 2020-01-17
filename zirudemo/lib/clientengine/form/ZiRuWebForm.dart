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
  bool isVisible = false;
  @override
  void initState() {
    super.initState();
    print("=======onloaded======" + widget._strOrginUrl);
  }

  Future<bool> _back() {
    widget.currentWebView.zrState
        .callbackJs("clientEngine.onClientBackPressed();");
    return new Future.value(false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //widget.currentWebView.zrState.callbackJs("onClientFormUnloaded();");

    print("=======unloaded======" + widget._strOrginUrl);
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    var bool = ModalRoute.of(context).isCurrent;
    if (bool) {
      widget.currentWebView.zrState
          .callbackJs("clientEngine.onClientFormFocused();");
      print("=======onfocus======" + widget._strOrginUrl);
      isVisible = true;
    } else if (isVisible == true) {
      widget.currentWebView.zrState
          .callbackJs("clientEngine.onClientFormUnfocused();");
      print("=======unfocus======" + widget._strOrginUrl);
      isVisible = false;
    }
  }

  @override
  void didChangeDependencies() {
    var bool = ModalRoute.of(context).isCurrent;

    super.didChangeDependencies();
    if (bool) {
      if (isVisible == false) {
        isVisible = true;
        if (widget.currentWebView != null) {
          widget.currentWebView.zrState
              .callbackJs("clientEngine.onClientFormFocused()");
          print("=======onfocus======" + widget._strOrginUrl);
        }
      }
    }
  }

  ZRWebView _getWeView() {
    if (widget.currentWebView == null) {
      widget.currentWebView = new ZRWebView(widget.strUrl);
    }
    return widget.currentWebView;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _back,
        child: Stack(
          children: <Widget>[_getWeView()],
        ));
  }
}
