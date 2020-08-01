import 'package:flutter/material.dart';
import 'package:greeny_go/droppage.dart';
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
          ]),
        ));
  }
}
