import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greeny_go/guestpage.dart';
import 'package:greeny_go/maps.dart';

class HomePage222 extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage222> {
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 310),
                child: Text(
                  'NAME',
                  style: TextStyle(fontSize: 15),
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
                padding: const EdgeInsets.only(top: 60, right: 260),
                child: Text(
                  'CUSTOMER ID',
                  style: TextStyle(fontSize: 15),
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
                padding: const EdgeInsets.only(top: 50, right: 230),
                child: Text(
                  'MOBILE NUMBER',
                  style: TextStyle(fontSize: 15),
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
                      hintText: 'Do not exceed more than 600 kgs'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 210),
                child: Text(
                  'DELIVERY LOCATION',
                  style: TextStyle(fontSize: 15),
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
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30, right: 40, left: 40),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return DetailPage();
                      }));
                    },
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Colors.amber,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Text(
                      'SUBMIT',
                    ),
                  )),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 30, right: 40, left: 40),
                  child: RaisedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return MapsPage();
                      // }));
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
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: RaisedButton(
              //     color: Colors.amber,
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (BuildContext context) {
              //         return DetailPage();
              //       }));
              //     },
              //     child: Text('Submit'),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: RaisedButton(
              //     color: Colors.amber,
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (BuildContext context) {
              //         return MapsPage();
              //       }));
              //     },
              //     child: Text('Map'),
              //   ),
              // )
            ],
          ),
        ));
  }
}

class APIDetailView {
  APIDetailView(data);
}
