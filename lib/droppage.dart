import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'maps.dart';

class PickupPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _PickupPageState createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  @override
  // HomePage createState() => HomePage();

  @override
  Widget build(BuildContext context) {
    // var data;
    var getCustData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text('Details'),
          actions: [
            IconButton(icon: Icon(Icons.add_circle), onPressed: getCustData),
          ],
        ),
        //body:
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 310),
                child: Text(
                  'NAME',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 270),
                child: Text(
                  'CUSTOMER ID',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 250),
                child: Text(
                  'MOBILE NUMBER',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 280),
                child: Text(
                  'QUANTITY',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Do not exceed more than 20 tonnes'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 230),
                child: Text(
                  'DROP LOCATION',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  color: Colors.amber,
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Your order has been registered",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 14.0);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return PickupPage();
                      },
                    ));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}

class APIDetailView {
  APIDetailView(data);
}
