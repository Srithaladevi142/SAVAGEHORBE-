import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Welcome'),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 1),
            child: Image.asset(
              'images/01.jpg',
              height: 350,
              scale: 0.0000001,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: RaisedButton(
                color: Colors.amber,
                child: Text('Login'),
                onPressed: () {
                  Navigator.pushNamed(context, '/o');
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: RaisedButton(
                color: Colors.amber,
                child: Text('Signup'),
                onPressed: () {
                  Navigator.pushNamed(context, '/mp');
                }),
          )
        ])));
  }
}
