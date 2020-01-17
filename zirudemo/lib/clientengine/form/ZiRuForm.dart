import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';
import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';
import 'package:zirudemo/manager/FormListManager.dart';

class ZiRuForm extends StatefulWidget {
  String strOrginUrl;
  String strUrl;
  String strTitle;
  String strData;
  int nOpenMode;
  int nAnimation;

  ZiRuForm(this.strOrginUrl, this.strUrl, this.strTitle, this.strData,
      this.nOpenMode, this.nAnimation);

  @override
  State<StatefulWidget> createState() {
    return ZiRuState();
  }
}

class ZiRuState extends State<ZiRuForm> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onBackPress() {
    ClientEngine().back(context, 2);
    return new Future.value(false);
  }

  @override
  void dispose() {
    super.dispose();
    print("=======dispose======");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("=======deactivate======");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("=======didChangeDependencies======");
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPress,
        child: Stack(
          children: <Widget>[new ZRWebView(widget.strUrl)],
        ));
  }
}
