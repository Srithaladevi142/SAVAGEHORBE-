import 'package:flutter/material.dart';
import 'package:greeny_go/consumers/product_details.dart';
import 'package:flutter/cupertino.dart';

import 'package:greeny_go/otp/otp.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => new _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  var grain_list = [
    {
      "name": "paddy",
      "image": "images/Paddy.jpg",
      "order": "Farmername:Manoj",
      "warehouse location": "sathy",
      "contact": "8807999069"
    },
    {
      "name": "Wheat",
      "image": "images/Wheat.jpg",
      "order": "Farmername:Poorni",
      "warehouse location": "kumbakonam",
      "contact": "9715969426"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: GridView.builder(
          itemCount: grain_list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (BuildContext context, int index) {
            return new SingleProduct(
              grain_name: grain_list[index]['name'],
              grain_image: grain_list[index]['image'],
              grain_order: grain_list[index]['order'],
              grain_location: grain_list[index]['warehouse location'],
              grain_contact: grain_list[index]['contact'],
            );
          }),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final grain_name;
  final grain_image;
  final grain_order;
  final grain_location;
  final grain_contact;

  SingleProduct(
      {this.grain_name,
      this.grain_image,
      this.grain_contact,
      this.grain_location,
      this.grain_order});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: new Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: new Hero(
            tag: grain_name,
            child: new Material(
              child: new InkWell(
                child: new GridTile(
                  footer: new Container(
                    color: Colors.white70,
                    child: new ListTile(
                      leading: Text(
                        grain_name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      grain_image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.grey[200],
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(
//               height: 350,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: <Widget>[
//                   Card(
//                     elevation: 2.0,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         new GestureDetector(
//                           child: Image(
//                             height: 110,
//                             image: AssetImage('images/02.jpg'),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(1.0),
//                           child: RaisedButton(
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(
//                                     builder: (BuildContext context) {
//                                   return OtpPage();
//                                 }));
//                               },
//                               color: Colors.pink,
//                               child: Text(
//                                 "Get more details",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'Consolas',
//                                     fontSize: 10.0),
//                               )),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
