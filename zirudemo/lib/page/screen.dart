import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zirudemo/clientengine/ClientEngine.dart';

class Screen1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Streen1State();
  }
}

class Streen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    Widget childForm = Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          ClientEngine().openform(context, "form_screen2", "", "strData", 0, 1);
        },
        child: Text(
          'screen1',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Screen1")),
      body: childForm,
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Streen2State();
  }
}

class Streen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    Widget childForm = Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: RaisedButton(
        onPressed: () {
          ClientEngine().openform(context, "form_screen3", "", "strData", 0, 1);
        },
        child: Text(
          'screen2',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Screen2")),
      body: childForm,
    );
  }
}

class Screen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Streen3State();
  }
}

class Streen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget childForm = Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          ClientEngine().openform(context, "first.html", "", "strData", 0, 1);
        },
        child: Text(
          'screen3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text("Screen3")),
      body: childForm,
    );
  }
}

class AniUtls {
  static SlideTransition getForm(
      Widget childForm, BuildContext context, TickerProviderStateMixin tick) {
    Map map = ModalRoute.of(context).settings.arguments;
    int nAnimation = map["nAnimation"];
    AnimationController animation =
        AnimationController(duration: const Duration(seconds: 2), vsync: tick);

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
    SlideTransition slideTransition = SlideTransition(
      position:
          Tween<Offset>(begin: Offset(beginX, beginY), end: Offset(endX, endY))
              .animate(animation),
      child: childForm,
    );

    return slideTransition;
  }
}
