// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:greeny_go/otp/mainpage1.dart';

// //void main() => runApp(OtpProcess());

// // class OtpProcess extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //    return Scaffold(
// //     // routes: {
// //   //   '/': (_) => MyApp1(),
// //   //   '/o': (_) => OrderPage(),
// //   //   '/mp': (_) => MainPage1(),
// //   // }
// //   );
// //   }

// //   }

// class MyApp1 extends StatefulWidget {
//   @override
//   _MyApp1State createState() => _MyApp1State();
// }

// class _MyApp1State extends State<MyApp1> {
//   String phoneNo;

//   String smscode;

//   String verificationId;

//   Future<void> verifyPhone() async {
//     final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
//       this.verificationId = verId;
//     };
//     final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
//       this.verificationId = verId;
//       smsCodeDialog(context).then((value) {
//         print('Signed in');
//       });
//     };
//     final PhoneVerificationCompleted verifiedSuccess = (AuthCredential user) {
//       print('verified');
//     };
//     final PhoneVerificationFailed verififailed = (AuthException exception) {
//       print('${exception.message}');
//     };
//     // FirebaseAuth.instance.

//     await FirebaseAuth.instance.verifyPhoneNumber(
//         //  print('ENTER MOBILE NUMBER'),
//         phoneNumber: "+91" + this.phoneNo,
//         codeAutoRetrievalTimeout: autoRetrieve,
//         codeSent: smsCodeSent,
//         timeout: const Duration(seconds: 50),
//         verificationCompleted: verifiedSuccess,
//         verificationFailed: verififailed);
//   }

//   Future<bool> smsCodeDialog(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Enter sms code'),
//             content: TextField(
//               onChanged: (value) {
//                 this.smscode = value;
//               },
//             ),
//             contentPadding: EdgeInsets.all(10.0),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text('Done'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   signIn();
//                 },
//               )
//             ],
//           );
//         });
//   }

//   // signIn() {
//   //   FirebaseAuth.instance
//   //        .verifyPhoneNumber(phoneNumber: )
//   //        .then((user){
//   //          Navigator.of(context).pushReplacementNamed('/WelcomePage');
//   //        }).catchError((e) {
//   //          print(e);
//   //        });
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('PhoneAuth'),
//         ),
//         body: Center(
//           child: Container(
//               padding: EdgeInsets.all(25.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TextField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                         hintText: 'Enter Phone Number', prefixText: '+91'),
//                     onChanged: (value) {
//                       this.phoneNo = value;
//                     },
//                   ),
//                   SizedBox(height: 10.0),
//                   RaisedButton(
//                     onPressed: verifyPhone,
//                     child: Text('verify'),
//                     textColor: Colors.white,
//                     elevation: 7.0,
//                     color: Colors.blue,
//                   )
//                 ],
//               )),
//         ));
//   }

//   void signIn() async {
//     AuthCredential authCredential = PhoneAuthProvider.getCredential(
//         verificationId: verificationId, smsCode: smscode);
//     await FirebaseAuth.instance.signInWithCredential(authCredential);
//     FirebaseAuth.instance.currentUser().then((user) {
//       if (user != null) {
//         Navigator.of(context).pop();
//         Navigator.push(context,
//             MaterialPageRoute(builder: (BuildContext context) {
//           return MainPage1();
//         }));
//       } else {
//         Navigator.of(context).pop();

//         // signIn();
//       }
//     });
//   }
// }
