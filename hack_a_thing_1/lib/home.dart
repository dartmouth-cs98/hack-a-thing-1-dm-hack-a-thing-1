import 'package:flutter/material.dart';
import 'package:hack_a_thing_1/loading_widget.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  void _onLogOut() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoadingWidget(
          loadingText: "Signing out, please wait...",
        );
      },
      barrierDismissible: false,
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: "log out",
            onPressed: () {
              _onLogOut();
            },
          )
        ],
        title: Text('Counter'),
        backgroundColor: Color.fromRGBO(41, 41, 41, 1),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}
