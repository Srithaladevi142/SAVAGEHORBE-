import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greeny_go/consumers/products.dart';

import 'horizontal_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle myStyle = TextStyle(fontFamily: 'Consolas', fontSize: 13);
  TextStyle myStyleSmall =
      TextStyle(fontFamily: 'Consolas', fontSize: 12, color: Colors.grey[600]);
  final _minpadding = 5.0;

  Widget imageCarousel = new Container(
    height: 225.0,
    child: new Carousel(
      overlayShadow: false,
      borderRadius: true,
      boxFit: BoxFit.cover,
      autoplay: false,
      dotSize: 4.0,
      indicatorBgPadding: 8.0,
      images: [
        new AssetImage('images/image14.jpg'),
        new AssetImage('images/image2.jpg'),
        new AssetImage('images/image3.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: new Duration(microseconds: 3000),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          new SizedBox(
            height: 5.0,
          ),

          //Image Carousel
          imageCarousel,

          //padding
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              'Categories',
            ),
          ),

          //Horizontal ListView
          HorizontalList(),

          //padding
          new Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 8.0),
            child: new Text(
              'Recent Products',
            ),
          ),

          //making shopping products
          new Container(
            height: 400.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}
