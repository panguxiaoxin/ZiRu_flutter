import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zirudemo/clientengine/form/ZiRuWebForm.dart';

import '../ZRConstants.dart';

class FormViewManager {
  openform(BuildContext context, String strOrginUrl, String strTitle,
      String strData, int nOpenMode, int nAnimation) {
    if (strOrginUrl.startsWith("form")) {
      handFormMode(strOrginUrl, context, nOpenMode, nAnimation);
    } else {
      String strUrl = ZRConstants.zipPath + strOrginUrl;
      ZiRuWebForm form = ZiRuWebForm(
          strOrginUrl, strUrl, strTitle, strData, nOpenMode, nAnimation);
      Route route = null;
      if (nOpenMode != 3) {
        route = handAminatin(form, nAnimation);
      }

      handWebMode(strUrl, context, nOpenMode, route);
    }
  }

  handFormMode(
      String url, BuildContext context, int nOpenMode, int nAnimation) {
    if (nOpenMode == 0) {
      Navigator.pushNamed(context, url,
          arguments: {"form": url, "nAnimation": nAnimation});
    } else if (nOpenMode == 1) {
      Navigator.pushReplacementNamed(context, url,
          arguments: {"form": url, "nAnimation": nAnimation});
    } else if (nOpenMode == 2) {
      Navigator.pushNamedAndRemoveUntil(
          context, url, (currentroute) => currentroute == null,
          arguments: {"form": url});
    } else if (nOpenMode == 3) {
      Navigator.popUntil(context, (currentroute) {
        Map data = currentroute.settings.arguments;
        String currentUrl = data["form"];
        return currentUrl == url;
      });
    }
  }

  handWebMode(String url, BuildContext context, int nOpenMode, Route route) {
    if (nOpenMode == 0) {
      Navigator.push(context, route);
    } else if (nOpenMode == 1) {
      Navigator.pushReplacement(context, route);
    } else if (nOpenMode == 2) {
      Navigator.pushAndRemoveUntil(
          context, route, (currentroute) => currentroute == null);
    } else if (nOpenMode == 3) {
      Navigator.popUntil(context, (currentroute) {
        Map data = currentroute.settings.arguments;
        String currentUrl = data["form"];
        return currentUrl == url;
      });
    }
  }

  Route handAminatin(ZiRuWebForm childForm, int nAnimation) {
    return PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          double beginX = 0;
          double beginY = 0;
          double endX = 0;
          double endY = 0;
          if (nAnimation == 1) {
            beginX = 1;
          } else if (nAnimation == 2) {
            endX = 1;
          } else if (nAnimation == 3) {
            beginY = 1;
          } else if (nAnimation == 4) {
            endY = 1;
          }
          return SlideTransition(
            position: Tween<Offset>(
                    begin: Offset(beginX, beginY), end: Offset(endX, endY))
                .animate(animation),
            child: childForm,
          );
        },
        settings: RouteSettings(arguments: {"form": childForm.strUrl}));
  }

  back(BuildContext context, int nAnimation) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
