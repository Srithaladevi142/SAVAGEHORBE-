// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class OtpPage extends StatefulWidget{
//   @override
//   _OtpPageState createState() => _OtpPageState();
// }

// class _OtpPageState extends State<OtpPage> {

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Detail'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Text(''),
//               SizedBox(
//                 height: 15.0,
//               ),
//               OutlineButton(
//                 borderSide: BorderSide(
//                   color:Colors.red,style: BorderStyle.solid,width:3.0),
//                   child: Text('Logout'),
//                   onPressed: (){
//                     FirebaseAuth.instance.signOut();
//                   },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:greeny_go/consumers/products.dart';

// import 'cart.dart';
// import 'main.dart';

// class ProductDetails extends StatefulWidget {
//   final productDetailsName;
//   final productDetailsImage;
//   final productDetailsNewPrice;

//   ProductDetails(
//       {this.productDetailsName,
//       this.productDetailsImage,
//       this.productDetailsNewPrice});

//   @override
//   _ProductDetailsState createState() => new _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: new Scaffold(

//         body: new ListView(
//           children: <Widget>[
//             // Setting the image and details of the product
//             new Container(
//               height: 300.0,
//               child: new GridTile(
//                 child: new Padding(
//                   padding: const EdgeInsets.only(left: 16.0),
//                   child: new Container(
//                       height: 25.0,
//                       color: Colors.white70,
//                       child: new Image.asset(widget.productDetailsImage)),
//                 ),
//                 footer: new Container(
//                   color: Colors.white70,
//                   child: new ListTile(
//                     leading: new Text(
//                       "${widget.productDetailsName}",
//                       style: new TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 14.0,
//                           color: Colors.cyan),
//                     ),

//             ListTile(
//               leading: Icon(Icons.person),
//               title: Text('HARIHARAN'),
//               subtitle: Text('Ordered 30kgs of Tomato'),
//             ),

//                   ),
//                 ),
//               ),
//             ),

//             //
//             new Row(
//               children: <Widget>[
//                 new Expanded(
//                   child: new MaterialButton(
//                     child: new Row(
//                       children: <Widget>[
//                         new Expanded(
//                           child: TextField(
//                             keyboardType: TextInputType.number,
//                             decoration: InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: 'ENTER THE QUANTITY IN Kgs'),
//                           ),
//                         ),
//                       ],
//                     ),
//                     color: Colors.white,
//                     textColor: Colors.grey,
//                     onPressed: () {},
//                   ),
//                 ),
//               ],
//             ),

//           ],
//         ),
//       ),
//     );
//   }
// }
