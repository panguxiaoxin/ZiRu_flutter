import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/form/ZiRuWebForm.dart';
import 'package:zirudemo/clientengine/interface/PageFinishListener.dart';
import 'package:zirudemo/clientengine/traslation/CustomRouteSlide.dart';
import 'package:zirudemo/clientengine/view/ZRWebView.dart';
import 'package:zirudemo/manager/FormListManager.dart';

import '../ZRConstants.dart';

class FormViewManager implements PageFinishListener {
  BuildContext mcontext;
  ZiRuWebForm pre;
  openform(BuildContext context, String strOrginUrl, String strTitle,
      String strData, int nOpenMode, int nAnimation) {
    mcontext = context;
    String strUrl = ZRConstants.zipPath + strOrginUrl;
    if (FormListManager.getInstance().size() == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ZiRuWebForm(
            strOrginUrl, strUrl, strTitle, strData, nOpenMode, nAnimation);
      }));
      // Navigator.push(
      //     context,
      //     CustomRouteSlide(ZiRuWebForm(
      //         strOrginUrl, strUrl, strTitle, strData, nOpenMode, nAnimation)));
    } else {
      pre = ZiRuWebForm(
          strOrginUrl, strUrl, strTitle, strData, nOpenMode, nAnimation);
      ZRFormState currentFormState =
          FormListManager.getInstance().getCurrentForm();
      ZRWebView zrWebView = new ZRWebView(strUrl);
      zrWebView.listener = this;
      currentFormState.ziRuWebForm.preInitWebView = zrWebView;
      currentFormState.zrState.initPreWebView(true, null);
    }
  }

  @override
  void callBack(ZRWebView zrWebView) {
    print("finish===CallBack=====");
    ZRFormState currentFormState =
        FormListManager.getInstance().getCurrentForm();
    currentFormState.zrState.initPreWebView(false, this);
  }

  @override
  void buildCallBack(ZRWebView zrWebView) {
    print("buildCallBack=====");
    pre.currentWebView = zrWebView;
    // Navigator.push(mcontext, MaterialPageRoute(builder: (context) {
    //   return pre;
    // }));
    Navigator.push(mcontext, PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
      return SlideTransition(
          position: Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
              .animate(animation),
          child: pre);
    }));
  }

  back(BuildContext context, int nAnimation) {
    BuildContext context =
        FormListManager.getInstance().getCurrentForm().zrState.mcontext;
    FormListManager.getInstance()
        .remove(FormListManager.getInstance().getCurrentForm());
    Navigator.pop(context);
  }
}
