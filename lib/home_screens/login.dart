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
import 'package:speech_recognition/speech_recognition.dart';

import '../application.dart';
import '../apptranslation.dart';

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
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
    languagesList[2]: languageCodesList[2],
  };

  String label = languagesList[0];

  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    application.onLocaleChanged = onLocaleChange;
    onLocaleChange(Locale(languagesMap["English"]));
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _select(String language) {
    print("dd " + language);
    onLocaleChange(Locale(languagesMap[language]));
    setState(() {
      if (language == "हिंदी") {
        label = "हिंदी";
      } else if (language == "தமிழ்") {
        label = "தமிழ்";
      } else {
        label = language;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: new AppBar(
        title: new Text(
          " ",
          style: new TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            // overflow menu
            onSelected: _select,
            icon: new Icon(Icons.language, color: Colors.white),
            itemBuilder: (BuildContext context) {
              return languagesList.map<PopupMenuItem<String>>((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
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
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.keyboard_voice),
                              onPressed: () {
                                SpeechRecognition();
                              }),
                          hintText: "Email",
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

// import 'package:flutter/material.dart';
// import 'package:greeny_go/custom_field_text.dart';
// import 'package:greeny_go/apptranslation.dart';
// import 'package:greeny_go/application.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageScreenState createState() => new _LoginPageScreenState();
// }

// class _LoginPageScreenState extends State<LoginPage> {
//   static final List<String> languagesList = application.supportedLanguages;
//   static final List<String> languageCodesList =
//       application.supportedLanguagesCodes;

//   final Map<dynamic, dynamic> languagesMap = {
//     languagesList[0]: languageCodesList[0],
//     languagesList[1]: languageCodesList[1],
//     languagesList[2]: languageCodesList[2],
//   };

//   String label = languagesList[0];

//   final formKey = new GlobalKey<FormState>();
//   final scaffoldKey = new GlobalKey<ScaffoldState>();

//   final teEmail = TextEditingController();
//   final tePassword = TextEditingController();

//   FocusNode _focusNodeEmail = new FocusNode();
//   FocusNode _focusNodePass = new FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     application.onLocaleChanged = onLocaleChange;
//     onLocaleChange(Locale(languagesMap["Hindi"]));
//   }

//   void onLocaleChange(Locale locale) async {
//     setState(() {
//       AppTranslations.load(locale);
//     });
//   }

//   @override
//   void dispose() {
//     teEmail.dispose();
//     tePassword.dispose();
//     super.dispose();
//   }

//   void _select(String language) {
//     print("dd " + language);
//     onLocaleChange(Locale(languagesMap[language]));
//     setState(() {
//       if (language == "हिंदी") {
//         label = "हिंदी";
//       } else if (language == "தமிழ்") {
//         label = "தமிழ்";
//       } else {
//         label = language;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var signUpForm = new Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         new Container(
//           alignment: FractionalOffset.center,
//           margin: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
//           padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
//           decoration: new BoxDecoration(
//             color: const Color.fromRGBO(255, 255, 255, 1.0),
//             border: Border.all(color: const Color(0x33A6A6A6)),
//             borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
//           ),
//           child: new Form(
//             key: formKey,
//             child: new Column(
//               children: <Widget>[
//                 new CustomTextField(
//                   inputBoxController: teEmail,
//                   focusNod: _focusNodeEmail,
//                   textSize: 12.0,
//                   margin: EdgeInsets.only(top: 20.0),
//                   textFont: "Nexa_Bold",
//                 ).textFieldWithOutPrefix(
//                     AppTranslations.of(context).text("key_email"),
//                     AppTranslations.of(context)
//                         .text("key_please_enter_valid_email")),
//                 new CustomTextField(
//                   inputBoxController: tePassword,
//                   focusNod: _focusNodePass,
//                   textSize: 12.0,
//                   isPassword: true,
//                   margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
//                   textFont: "Nexa_Bold",
//                 ).textFieldWithOutPrefix(
//                     AppTranslations.of(context).text("key_password"),
//                     AppTranslations.of(context)
//                         .text("key_must_be_at_least_6_characters")),
//               ],
//             ),
//           ),
//         ),
//         new Container(
//           margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
//           child: buttonWithColorBg(
//               AppTranslations.of(context).text("key_next"),
//               EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
//               const Color(0xFFFFD900),
//               const Color(0xFF28324E)),
//         ),
//       ],
//     );

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//           brightness: Brightness.light,
//           primarySwatch: Colors.pink,
//           canvasColor: Colors.white,
//           accentColor: Colors.red),
//       home: new Scaffold(
//         backgroundColor: Colors.cyan[50],
//         appBar: new AppBar(
//           title: new Text(
//             " ",
//             style: new TextStyle(color: Colors.white),
//           ),
//           actions: <Widget>[
//             PopupMenuButton<String>(
//               // overflow menu
//               onSelected: _select,
//               icon: new Icon(Icons.language, color: Colors.white),
//               itemBuilder: (BuildContext context) {
//                 return languagesList
//                     .map<PopupMenuItem<String>>((String choice) {
//                   return PopupMenuItem<String>(
//                     value: choice,
//                     child: Text(choice),
//                   );
//                 }).toList();
//               },
//             ),
//           ],
//         ),
//         key: scaffoldKey,
//         body: new Container(
//           child: new SingleChildScrollView(
//             child: new Center(
//               child: signUpForm,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buttonWithColorBg(
//       String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
//     var loginBtn = new Container(
//       margin: margin,
//       padding: EdgeInsets.all(15.0),
//       alignment: FractionalOffset.center,
//       decoration: new BoxDecoration(
//         color: bgColor,
//         borderRadius: new BorderRadius.all(const Radius.circular(6.0)),
//       ),
//       child: Text(
//         buttonLabel,
//         style: new TextStyle(
//             color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
//       ),
//     );
//     return loginBtn;
//   }
// }
