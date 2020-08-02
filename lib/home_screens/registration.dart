import 'package:flutter/material.dart';
import 'package:greeny_go/consumers/home.dart';
import 'package:greeny_go/home_page.dart';
// import 'package:gre/home_screens/home_page.dart';
import 'package:greeny_go/home_screens/main_view.dart';
import 'package:greeny_go/otp/mainotp.dart';
import 'package:greeny_go/otp/mainpage1.dart';
import 'package:greeny_go/otp/welcome.dart';
// import 'package:gre/home_screens/signup/farmerssignup.dart';
// import 'package:gre/home_screens/signup/warehousesignup.dart';
import 'package:greeny_go/ware/home_screen.dart';
import 'package:greeny_go/voice.dart';
import 'package:greeny_go/consumers/myhome.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../application.dart';
import '../apptranslation.dart';

// import 'package:gre/home_screens/signup/consumerssignin.dart';
// import 'package:gre/home_screens/signup/farmerssignup.dart';
// import 'package:gre/home_screens/signup/logisticssignup.dart';
// import 'package:gre/home_screens/signup/warehousesignup.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

String name;
String email;
String mobileNumber;
String password;

class _RegisterState extends State<Register> {
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

  final teEmail = TextEditingController();
  final tePassword = TextEditingController();
  final tename = TextEditingController();

  FocusNode _focusNodeEmail = new FocusNode();
  FocusNode _focusNodePassword = new FocusNode();
  FocusNode _focusNodeName = new FocusNode();

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
    teEmail.dispose();
    tePassword.dispose();
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

  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[50],
        appBar: new AppBar(
          backgroundColor: Colors.cyan[50],
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
                return languagesList
                    .map<PopupMenuItem<String>>((String choice) {
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
                Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 27),
                  ),
                ),

                Card(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.keyboard_voice),
                            onPressed: () {
                              SpeechRecognition();
                            }),
                        hintText: 'Name',
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
                        name = value;
                      });
                    },
                  ),
                ),
                // Card(
                //   margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                //   elevation: 10,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(40))),
                //   child: TextField(
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.person),
                //         hintText: 'Last Name',
                //         hintStyle: TextStyle(color: Colors.black),
                //         filled: true,
                //         fillColor: Colors.white,
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.all(Radius.circular(40)),
                //         ),
                //         contentPadding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
                //   ),
                // ),
                Card(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.keyboard_voice),
                            onPressed: () {
                              SpeechRecognition();
                            }),
                        hintText: 'Email',
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
                        email = value;
                      });
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Mobile Number',
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
                      mobileNumber = value;
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        hintText: 'Password',
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
                    },
                  ),
                ),
                // Card(
                //   margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                //   elevation: 10,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(40))),
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //         prefixIcon: Icon(Icons.lock_outline),
                //         hintText: 'Confirm Password',
                //         hintStyle: TextStyle(color: Colors.black),
                //         filled: true,
                //         fillColor: Colors.white,
                //         border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.all(Radius.circular(40)),
                //         ),
                //         contentPadding:
                //             EdgeInsets.symmetric(horizontal: 20, vertical: 16)),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Farmers',
                      'WareHouse Authority',
                      'Logistics Services',
                      'Consumers'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // Expanded(
                //   child: dropdownValue == '          Farmers          '
                //       ? FarSign()
                //       : dropdownValue == '          WareHouse          '
                //           ? WareSign()
                //           : dropdownValue == '          Logistics          '
                //               ? LogisSign()
                //               : dropdownValue == '          Four           '
                //                   ? ConsumerSignin()
                //                   : Container(),
                // ),

                Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return dropdownValue == 'Farmers'
                              ? MainView()
                              : dropdownValue == 'WareHouse Authority'
                                  ? HomeScreen()
                                  : dropdownValue == 'Logistics Services'
                                      ? MainPage1()
                                      : dropdownValue == 'Consumers'
                                          ? HomePage()
                                          : Container();
                        }));
                      },
                      padding: EdgeInsets.symmetric(vertical: 16),
                      color: Colors.pink[200],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.black),
                      ),
                    ))
              ],
            ),
          ]),
        ));
  }
}
