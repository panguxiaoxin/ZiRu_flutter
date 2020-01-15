import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

class IndexPage extends StatelessWidget {
  ClientEngine clientEngine;
  @override
  Widget build(BuildContext context) {
    clientEngine = new ClientEngine();

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("init"),
            onPressed: () {
              clientEngine.init().then((result) {
                if (result) {
                  clientEngine.info("success！");
                } else {
                  clientEngine.info("fail");
                }
              });
            },
          ),
          RaisedButton(
            onPressed: () {
              clientEngine.saveData("abc", "我是小明");
            },
            child: Text("sp_save"),
          ),
          RaisedButton(
            onPressed: () {
              clientEngine.info(clientEngine.loadData("abc"));
            },
            child: Text("sp_load"),
          ),
          RaisedButton(
            onPressed: () {
              clientEngine.setSharedData("abc", "我是小红");
            },
            child: Text("share_save"),
          ),
          RaisedButton(
            onPressed: () {
              clientEngine.info(clientEngine.getSharedData("abc"));
            },
            child: Text("share_load"),
          ),
          RaisedButton(
            onPressed: () {
              clientEngine.openform(context, "me.html", "1", "0", 0, 1);
            },
            child: Text("openform"),
          )
        ],
      ),
    );
  }
}
