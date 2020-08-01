import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_e_commerce/home.dart';

// import 'package:flutter_e_commerce/payment.dart';
// import 'package:flutter_e_commerce/fruit.dart';
// import 'package:flutter_e_commerce/veg.dart';
// import 'package:flutter_e_commerce/grain.dart';
import 'package:greeny_go/consumers/veg.dart';

import '../home_page.dart';
import '../home_page.dart';
import '../payment.dart';
import 'fruit.dart';
import 'grain.dart';
import 'home.dart';

void main() {
  runApp(new MyHome());
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.pinkAccent,
      ),
      routes: {
        '/': (_) => HomePage(),
        '/p': (_) => Payment(),
        '/f': (_) => Fruits(),
        '/v': (_) => Vegetables(),
        '/g': (_) => Grains(),
      },
    );
  }
}
