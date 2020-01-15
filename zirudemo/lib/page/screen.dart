import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigator.pushNamed(context,
            //                     "/Screen2",
            //                     arguments: {
            //                       "url":"eddddd"
            //                     });
            // Navigator.push(context, 
            //                MaterialPageRoute(
            //                  builder: (context){
            //                   return Screen2();
            //                  }));
            // Navigator.pushNamed(context, '/screen2');
          },
          child: Text(
            'screen1',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('2'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/screen3');
          },
          child: Text(
            'screen2',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/screen4');
            // Navigator.push(
            //   context, 
            //   MaterialPageRoute(
            //     builder: (BuildContext context){
            //       return Container(
            //         color: Colors.red,
            //         child: Text('ddddd'),
            //       );
            //     }
            //   )
            // );
          },
          child: Text(
            'screen3',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('4'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/screen4');
          },
          child: Text(
            'screen4',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
