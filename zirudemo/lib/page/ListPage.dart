import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ListState();
  }
}

class ListState extends State<ListPage> {
  List<ViewState> urls = new List();
  Map map = new Map();

  @override
  void initState() {
    super.initState();
    ViewState viewState = ViewState();
    viewState.isVisable = true;
    viewState.url = "https://www.baidu.com/";
    urls.add(viewState);
  }

  WebView getTargetView(url) {
    WebView view = map[url];

    if (view == null) {
      if (url == "https://www.baidu.com/") {
        view = const WebView(
          initialUrl: "https://www.baidu.com/",
          javascriptMode: JavascriptMode.unrestricted,
        );
      } else {
        view = const WebView(
          initialUrl: "https://baike.baidu.com/item/妹子/623962?fr=aladdin",
          javascriptMode: JavascriptMode.unrestricted,
        );
      }

      //map[url] = view;
    }
    return view;
  }

  Widget _getViewList(List<ViewState> cookieList) {
    final Iterable<Container> cookieWidgets =
        cookieList.map((ViewState data) => (Container(
              height: 500,
              width: 600,
              child: getTargetView(data.url),
            )));

    return Stack(
      children: cookieWidgets.toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('列表测试'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 30,
              child: Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("openform"),
                    onPressed: () {
                      setState(() {
                        ViewState viewState = new ViewState();
                        viewState.url =
                            "https://baike.baidu.com/item/妹子/623962?fr=aladdin";
                        viewState.isVisable = true;
                        urls.add(viewState);
                        print("revese==before=");
                        Future.delayed(Duration(seconds: 5)).then((_) {
                          setState(() {
                            print("revese===");
                            ViewState rem = urls.removeLast();
                            urls.add(rem);
                          });
                        });
                      });
                    },
                  ),
                  RaisedButton(
                    child: Text("back"),
                    onPressed: () {
                      setState(() {
                        urls.removeLast();
                      });
                    },
                  ),
                ],
              ),
            ),
            _getViewList(urls),
          ],
        ));
  }
}

class ViewState {
  String url;
  bool isVisable;
}
