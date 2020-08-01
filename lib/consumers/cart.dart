import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greeny_go/consumers/payment.dart';

import 'main.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => new _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  leading: Image.asset('images/image4.jpg'),
                  title: Text('CARROT'),
                  subtitle: Text('12 Kgs'),
                  trailing: Text('Rs:150'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  leading: Image.asset('images/image5.jpg'),
                  title: Text('TOMATO'),
                  subtitle: Text('20 Kgs'),
                  trailing: Text('Rs:250'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  leading: Image.asset('images/image7.jpg'),
                  title: Text('GARLIC'),
                  subtitle: Text('7 Kgs'),
                  trailing: Text('Rs:90'),
                ),
              )
            ],
          ),
        ),
        appBar: new AppBar(
          centerTitle: true,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.pinkAccent,
          title: new InkWell(
              onTap: () {
                Navigator.of(context).push(
                  new MaterialPageRoute(
                    builder: (BuildContext context) => MyHome(),
                  ),
                );
              },
              child: new Text(
                'CART',
              )),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
          ],
        ),
        bottomNavigationBar: new Container(
          color: Colors.white,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Text(
                  'Total:\₹490',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              new Expanded(
                child: new MaterialButton(
                  color: Colors.pinkAccent,
                  splashColor: Colors.greenAccent,
                  child: new Text(
                    'Check Out',
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Payment();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
