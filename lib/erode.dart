import 'package:flutter/material.dart';

class Erode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Suggestion'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Image.asset('images/Erode.PNG')],
        ),
      ),
    );
  }
}
