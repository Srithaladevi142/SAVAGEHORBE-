// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:gre/home_screens/navigation_screens/chat.dart';
// import 'package:gre/home_screens/navigation_screens/myWallet.dart';
// import 'package:gre/home_screens/navigation_screens/myhome.dart';

// import 'navigation_screens/subs_screen.dart';

// class MainView extends StatefulWidget {
//   @override
//   _MainViewState createState() => _MainViewState();
// }

// class _MainViewState extends State<MainView> {
//   ScbsPage _subsPage;
//   MyHome _myHomePage;
//   MyWallet _myWallet;
//   Chats _chats;

//   List<Widget> pages;
//   Widget currentPage;

//   int _selectedIndex = 0;
//   static const TextStyle optionStyle = TextStyle(
//       fontFamily: 'Consolas', fontSize: 13, fontWeight: FontWeight.normal);

//   @override
//   void initState() {
//     _subsPage = ScbsPage();
//     _myHomePage = MyHome();
//     _myWallet = MyWallet();
//     _chats = Chats();

//     pages = [_myHomePage, _subsPage, _myWallet, _chats];
//     currentPage = _myHomePage;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: currentPage,
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             title: Text(
//               'Home',
//               style: optionStyle,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.event_note),
//             title: Text(
//               'Subscription',
//               style: optionStyle,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance_wallet),
//             title: Text(
//               'My wallet',
//               style: optionStyle,
//             ),
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.chat),
//             title: Text(
//               'Chat',
//               style: optionStyle,
//             ),
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         fixedColor: Colors.pink,
//         onTap: (int index) {
//           setState(() {
//             _selectedIndex = index;
//             currentPage = pages[index];
//           });
//         },
//         type: BottomNavigationBarType.fixed,
//       ),
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: DataSearch(),
//               );
//             },
//           ),
//           IconButton(
//               icon: Icon(Icons.account_circle),
//               onPressed: () {
//                 Fluttertoast.showToast(
//                     msg: "Account Clicked",
//                     toastLength: Toast.LENGTH_SHORT,
//                     gravity: ToastGravity.BOTTOM,
//                     timeInSecForIos: 2,
//                     backgroundColor: Colors.black,
//                     textColor: Colors.white,
//                     fontSize: 14.0);
//               }),
//         ],
//         title: Text(
//           'Daily',
//           style: TextStyle(fontFamily: 'Consolas'),
//         ),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: Text(
//                 'srithala',
//                 style: TextStyle(fontFamily: 'Consolas'),
//               ),
//               accountEmail: Text(
//                 'srithaladevi@gmail.com',
//                 style: TextStyle(fontFamily: 'Consolas'),
//               ),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text(
//                   'D',
//                   style: TextStyle(fontFamily: 'Consolas', fontSize: 25.0),
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text(
//                 'Home',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.home),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'My Account',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.account_circle),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Notification',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.notifications_active),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//                 title: Text(
//                   'My Order',
//                   style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//                 ),
//                 leading: Icon(Icons.beenhere),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   Navigator.of(context).pushReplacementNamed('/myOrders');
//                 }),
//             ListTile(
//               title: Text(
//                 'Your Story',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.content_paste),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Shop By Category',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.grid_on),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Rate our App',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.star),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Need Help?',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.help_outline),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Share',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.share),
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             ListTile(
//               title: Text(
//                 'Logout',
//                 style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
//               ),
//               leading: Icon(Icons.input),
//               onTap: () => Navigator.of(context).pop(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DataSearch extends SearchDelegate<String> {
//   final items = [
//     'Milk',
//     'Fruits',
//     'Vegitable',
//     'Bakery Products',
//     'Beverages',
//     'Beauty & Hygiene',
//     'Pet Care',
//     'Breakfast & Snacks',
//     'Pooja Needs',
//     'Food Grains Oils & Masalas',
//     'Baby Care'
//   ];
//   final recentItems = ['Milk', 'Fruits', 'Vegitable'];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return null;
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggetionList = query.isEmpty
//         ? recentItems
//         : items.where((p) => p.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           showResults(context);
//         },
//         leading: Icon(Icons.arrow_forward_ios),
//         title: RichText(
//           text: TextSpan(
//               text: suggetionList[index].substring(0, query.length),
//               style:
//                   TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//               children: [
//                 TextSpan(
//                     text: suggetionList[index].substring(query.length),
//                     style: TextStyle(color: Colors.grey))
//               ]),
//         ),
//       ),
//       itemCount: suggetionList.length,
//     );
//   }
// }

import 'dart:io';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:greeny_go/voice.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

import '../app_translations_delegate.dart';
import '../application.dart';
import '../apptranslation.dart';
import '../custom_text_field.dart';
import '../notification.dart';

class MainView extends StatefulWidget {
  @override
  _CropDetailsState createState() => _CropDetailsState();
}

class _CropDetailsState extends State<MainView> {
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

  final tecropdetails = TextEditingController();
  final tecropname = TextEditingController();
  final tequantity = TextEditingController();
  final telocation = TextEditingController();
  final tesubmit = TextEditingController();
  final teimages = TextEditingController();

  FocusNode _focusNodecropdetails = new FocusNode();
  FocusNode _focusNodecropname = new FocusNode();
  FocusNode _focusNodelocation = new FocusNode();
  FocusNode _focusNodeimages = new FocusNode();
  FocusNode _focusNodesubmit = new FocusNode();
  FocusNode _focusNodequantity = new FocusNode();

  @override
  void initState() {
    super.initState();
    application.onLocaleChanged = onLocaleChange;
    onLocaleChange(Locale(
      languagesMap["Hindi"],
    ));
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }

  @override
  void dispose() {
    tecropdetails.dispose();
    tecropname.dispose();
    tequantity.dispose();
    telocation.dispose();
    teimages.dispose();
    tesubmit.dispose();
    super.dispose();
  }

  void _select(String language) {
    print("dd " + language);
    onLocaleChange(Locale(languagesMap[language]));
    setState(() {
      if (language == "Hindi") {
        label = "हिंदी";
      } else if (language == "Tamil") {
        label = "தமிழ்";
      } else {
        label = language;
      }
    });
  }

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
                  'S',
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
                  'Logistics Booking',
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
                  'WareHouse Booking',
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
        title: CustomTextField(
          inputBoxController: tecropdetails,
          focusNod: _focusNodecropdetails,
          textSize: 12.0,
          textFont: "Nexa_Bold",
        ).textFieldWithOutPrefix(
            AppTranslations.of(context).text("cropdetails"),
            AppTranslations.of(context).text("")),
        backgroundColor: Colors.brown,
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 250),
              child: CustomTextField(
                inputBoxController: tecropname,
                focusNod: _focusNodecropname,
                textSize: 12.0,
                textFont: "Nexa_Bold",
              ).textFieldWithOutPrefix(
                  AppTranslations.of(context).text("cropname"),
                  AppTranslations.of(context).text("")),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.keyboard_voice),
                      onPressed: () {
                        //SpeechScreen();
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: CustomTextField(
                inputBoxController: tequantity,
                focusNod: _focusNodequantity,
                textSize: 12.0,
                textFont: "Nexa_Bold",
              ).textFieldWithOutPrefix(
                  AppTranslations.of(context).text("quatity"),
                  AppTranslations.of(context).text("")),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.keyboard_voice), onPressed: () {}),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: CustomTextField(
                inputBoxController: telocation,
                focusNod: _focusNodelocation,
                textSize: 12.0,
                textFont: "Nexa_Bold",
              ).textFieldWithOutPrefix(
                  AppTranslations.of(context).text("location"),
                  AppTranslations.of(context).text("")),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.keyboard_voice), onPressed: () {}),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, right: 250),
              child: CustomTextField(
                inputBoxController: teimages,
                focusNod: _focusNodeimages,
                textSize: 12.0,
                textFont: "Nexa_Bold",
              ).textFieldWithOutPrefix(
                  AppTranslations.of(context).text("images"),
                  AppTranslations.of(context).text("")),
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
                  child: CustomTextField(
                    inputBoxController: tesubmit,
                    focusNod: _focusNodesubmit,
                    textSize: 12.0,
                    textFont: "Nexa_Bold",
                  ).textFieldWithOutPrefix(
                      AppTranslations.of(context).text("submit"),
                      AppTranslations.of(context).text(" ")),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Added Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 14.0);

                    Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return MainView();
                      },
                    ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
