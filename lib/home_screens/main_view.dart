import 'dart:io';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:greeny_go/CropSuggestion.dart';
import 'package:greeny_go/Warehouse.dart';
import 'package:greeny_go/guestpage.dart';
import 'package:greeny_go/myaccount.dart';
import 'package:greeny_go/payment.dart';
import 'package:greeny_go/weather.dart';
// import 'package:gre/otp/welcome.dart';
import 'package:greeny_go/welcome.dart';
// import 'package:gre/yourstory.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../notification.dart';

class MainView extends StatefulWidget {
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<MainView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  File imageFile;
  _openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<Void> _showDialogueBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('OPEN WITH...'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('GALLERY'),
                    onTap: () {
                      _openGallery(context);
                    },
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: GestureDetector(
                      child: Text('CAMERA'),
                      onTap: () {
                        _openCamera(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'srithala',
                style: TextStyle(fontFamily: 'Consolas'),
              ),
              accountEmail: Text(
                'srithaladevi@gmail.com',
                style: TextStyle(fontFamily: 'Consolas'),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'D',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 25.0),
                ),
              ),
            ),
            ListTile(
                title: Text(
                  'Home',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MainView();
                  }));
                }),
            ListTile(
                title: Text(
                  'My Account',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.account_circle),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MyAccount();
                  }));
                }),
            ListTile(
                title: Text(
                  'Logistics',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.notifications_active),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return WelcomePage1();
                  }));
                }),
            ListTile(
                title: Text(
                  'My Order',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.beenhere),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Notifcation();
                  }));
                }),
            ListTile(
                title: Text(
                  'Payment',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.content_paste),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return Payment();
                  }));
                }),
            ListTile(
                title: Text(
                  'WareHouse',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.grid_on),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return WareHouse();
                  }));
                }),
            ListTile(
              title: Text(
                'Crop Suggestion',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.star),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return CropSuggestion();
                }));
              },
            ),
            ListTile(
              title: Text(
                'Weather Forecast',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.star),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return WeatherForecasting();
                }));
              },
            ),
            ListTile(
                title: Text(
                  'Need Help?',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.help_outline),
                onTap: () {}),
            // ListTile(
            //     title: Text(
            //       'Payment',
            //       style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
            //     ),
            //     leading: Icon(Icons.share),
            //     onTap: () { Navigator.push(context,
            //         MaterialPageRoute(builder: (BuildContext context) {
            //       return Payment();
            //     }));}),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.input),
              onTap: () async {
                Navigator.pop(context);
                await _auth.signOut();
                await _googleSignIn.signOut();
                FirebaseAuth.instance.signOut().then((value) {
                  print('SIGNEDOUT SUCCESSFULLY ');
                  Navigator.of(context).pushReplacementNamed('/loginpage');
                });
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('              Crop Details'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 250),
              child: Text(
                'CROP NAME',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: Text(
                '   QUANTITY IN KG/TON',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: Text(
                'LOCATION',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 250),
              child: Text(
                'Description',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: Text(
                'IMAGES',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: RaisedButton(
                onPressed: () {
                  _showDialogueBox(context);
                },
                child: Icon(Icons.add_circle),
              ),
            ),
            imageFile == null
                ? Container()
                : Image.file(
                    imageFile,
                    width: 400,
                    height: 100,
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: RaisedButton(
                child: Text('SUBMIT'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
