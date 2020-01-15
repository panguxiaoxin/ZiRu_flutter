
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/screen2');
        },
        child: Text(
          'screen1',
           style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/screen3');
        },
        child: Text(
          'screen2',
           style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/screen4');
        },
        child: Text(
          'screen3',
           style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}