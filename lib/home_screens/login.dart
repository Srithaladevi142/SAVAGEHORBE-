import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greeny_go/consumers/home.dart';
import 'package:greeny_go/home_screens/main_view.dart';
import 'package:greeny_go/home_screens/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greeny_go/otp/mainpage1.dart';
import 'package:greeny_go/voice.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greeny_go/ware/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

// final GoogleSignIn _googleSignIn = GoogleSignIn();
String email;
String password;

class _LoginPageState extends State<LoginPage> {
  GoogleSignIn _googleSignIn;

  @override
  void initState() {
    _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      body: Center(
          child: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Image.asset(
                'images/Tractor-Spraying-Crops.jpg',
                width: 1000,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170, left: 120),
                child: Text(
                  'GREENY_GO',
                  style: TextStyle(fontSize: 40, color: Colors.brown[200]),
                ),
              )
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Card(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.keyboard_voice),
                              onPressed: () {
                                VoiceHome();
                              }),
                          hintText: 'EMAIL',
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16)),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                        if (value.isEmpty) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(value))
                            return 'Please make sure your email address is valid';
                          else
                            return null;
                        }
                      }),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Card(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: 'PASSWORD',
                      hintStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                    if (value.isEmpty) {
                      return "The password field cannot be empty";
                    } else if (value.length < 6) {
                      return "the password has to be at least 6 characters long";
                    }
                  },
                ),
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.pink[200],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Text(
                    'LOGIN',
                  ),
                )),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Register();
                    }));
                  },
                  padding: EdgeInsets.symmetric(vertical: 16),
                  color: Colors.pink[200],
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: Text(
                    'SIGN UP',
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 30, right: 30, left: 30),
                child: RaisedButton(
                    onPressed: () {
                      try {
                        _googleSignIn.signOut();
                        _handleSignIn().then((user) async {
                          if (user != null) {
                            var db = Firestore.instance;
                            QuerySnapshot snapShots = await db
                                .collection('users')
                                .where("mail", isEqualTo: user.email)
                                .limit(1)
                                .getDocuments();
                            if (snapShots.documents.length == 0) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return null;
                              }));
                              return;
                            }
                            DocumentSnapshot snap = snapShots.documents[0];
                            String dropdownValue = snap.data['type'];

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return dropdownValue == 'farmers'
                                  ? MainView()
                                  : dropdownValue == 'warehouse'
                                      ? HomeScreen()
                                      : dropdownValue == 'logistics'
                                          ? MainPage1()
                                          : dropdownValue == 'Consumers'
                                              ? HomePage()
                                              : Container();
                            }));
                          }
                        });
                      } catch (e) {
                        print(e);
                      }
                    },
                    padding: EdgeInsets.symmetric(vertical: 16),
                    color: Colors.pink[200],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Text('SIGN UP WITH GOOGLE'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(FontAwesomeIcons.google),
                        )
                      ],
                    ))),
          ],
        ),
      ])),
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);
      return user;
    } catch (e) {
      print(e);
    }
  }
}
