import 'package:flutter/material.dart';
import 'package:hack_a_thing_1/loading_widget.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  void _onLoading() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return LoadingWidget(
          loadingText: "Signing in, please wait...",
        );
      },
      barrierDismissible: false,
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pop(context); //pop dialog
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";

  _LogInPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(41, 41, 41, 1),
        //body: _loading ? _bodyProgress : body
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("dartmouth.png"),
              Form(
                key: _formKey,
                child: _buildTextFields(),
              ),
              _buildButtons(),
            ],
          ),
        ));
  }

  Widget _buildTextFields() {
    return new Column(
      children: <Widget>[
        new Container(
          child: new TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
            },
            controller: _emailFilter,
            style: new TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                fillColor: Color.fromRGBO(72, 72, 72, 1),
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: 'Email'),
          ),
        ),
        SizedBox(height: 10),
        new Container(
          child: new TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a password';
              }
            },
            controller: _passwordFilter,
            style: new TextStyle(color: Colors.white),
            decoration: new InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  ),
                ),
                filled: true,
                fillColor: Color.fromRGBO(72, 72, 72, 1),
                hintStyle: new TextStyle(color: Colors.grey),
                hintText: 'Password'),
            obscureText: true,
          ),
        )
      ],
    );
  }

  Widget _buildButtons() {
    return new Container(
      child: new Column(
        children: <Widget>[
          SizedBox(
              width: double.infinity, //Match Parent
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    _onLoading();
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                elevation: 5.0,
                animationDuration: Duration(milliseconds: 500),
                child: Text('Log In'),
                color: Colors.red,
              )),
          FlatButton(
            child: new Text('Forgot Password?',
                style: new TextStyle(color: Colors.white)),
            onPressed: _passwordReset,
          )
        ],
      ),
    );
  }

  void _passwordReset() {
    print("The user wants a password reset request sent to $_email");
  }
}
