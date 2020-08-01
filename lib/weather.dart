import 'package:flutter/material.dart';

class WeatherForecasting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecasting'),
      ),
      body: Center(child: Column(children: <Widget>[Image.asset('images/Capture.JPG')],),),
    );
  }
}
