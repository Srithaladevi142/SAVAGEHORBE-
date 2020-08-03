import 'package:flutter/material.dart';
import 'package:greeny_go/droppage.dart';
import 'package:greeny_go/maps.dart';
import 'home_screens/home_page.dart';

class WelcomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Logistics'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('images/truck.jpg',
                      height: 400, width: 500, fit: BoxFit.fill),
                  // Text('Truck details')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PickupPage();
                  }));
                },
                child: Text('MINI VAN'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(0.0),
              child: RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PickupPage();
                  }));
                },
                child: Text('TRUCK'),
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, right: 40, left: 40),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MyApp();
                    }));
                  },
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.amber,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Text(
                    'MAP',
                  ),
                )),
          ]),
        ));
  }
}
