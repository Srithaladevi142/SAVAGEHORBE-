import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:greeny_go/ware/generate.dart';
import 'package:greeny_go/ware/scan.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greeny_go/ware/warehouseform.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text('WAREHOUSE'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Warehousedetail()),
                  );
                },
                child: const Text('Warehouse Details')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScanScreen()),
                  );
                },
                child: const Text('SCAN QR CODE')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GenerateScreen()),
                  );
                },
                child: const Text('GENERATE QR CODE')),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: () async {
                  await _auth.signOut();
                  await _googleSignIn.signOut();
                  FirebaseAuth.instance.signOut().then((value) {
                    print('SIGNEDOUT SUCCESSFULLY ');
                    Navigator.of(context).pushReplacementNamed('/loginpage');
                  });
                },
                child: const Text('LOGOUT')),
          ),
          // Drawer(
          //   child: ListView(
          //     children: <Widget>[
          //       UserAccountsDrawerHeader(
          //         accountName: Text(
          //           'srithala',
          //           style: TextStyle(fontFamily: 'Consolas'),
          //         ),
          //         accountEmail: Text(
          //           'srithaladevi@gmail.com',
          //           style: TextStyle(fontFamily: 'Consolas'),
          //         ),
          //         currentAccountPicture: CircleAvatar(
          //           backgroundColor: Colors.white,
          //           child: Text(
          //             '',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 25.0),
          //           ),
          //         ),
          //       ),
          //       ListTile(
          //         title: Text(
          //           'Home',
          //           style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //         ),
          //         leading: Icon(Icons.home),
          //         onTap: () => Navigator.of(context).pop(),
          //       ),
          //       ListTile(
          //           title: Text(
          //             'Logistics service',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.local_shipping),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return WelcomePage();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Warehouse Booking',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.local_convenience_store),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return WareHouse();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Crop suggestion',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.show_chart),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return CropSuggestion();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Weather forecasting',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.cloud),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return WeatherForecasting();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'My Account',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.account_circle),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return MyAccount();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Notification',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.notifications_active),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Notifcation();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'View Order',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.beenhere),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return ViewOrder();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Your Story',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.content_paste),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return YourStory();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Customers feedback',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.grid_on),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return FeedBack();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Rate our App',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.star),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Rating();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Need Help?',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.help_outline),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Help();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Share',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.share),
          //           onTap: () {
          //             // Navigator.push(context,
          //             //     MaterialPageRoute(builder: (BuildContext context) {
          //             //   return Share();
          //             // }));
          //           }),
          //       ListTile(
          //           title: Text(
          //             'Logout',
          //             style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
          //           ),
          //           leading: Icon(Icons.input),
          //           onTap: () async {
          //             await _auth.signOut();
          //             await _googleSignIn.signOut();
          //             FirebaseAuth.instance.signOut().then((value) {
          //               print('Signed out successfully');
          //               Navigator.of(context)
          //                   .pushReplacementNamed('/loginpage');
          //             });
          //           })
          //     ],
          //   ),
          // ),
        ],
      )),
    );
  }
}
