import 'package:flutter/material.dart';
import 'package:greeny_go/consumers/product_details.dart';

class Vegetables extends StatefulWidget {
  @override
  _VegetablesState createState() => new _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  var veg_list = [
    {"name": "Onion", "image": "images/Onion.jpg", "price": "60"},
    {"name": "Lady Finger", "image": "images/Lady Finger.jpg", "price": "40"},
    {"name": "Beans", "image": "images/beans.jpg", "price": "80"},
    {"name": "Beetroot", "image": "images/Beetroot.jpg", "price": "50"},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Vegetables'),
      ),
      body: GridView.builder(
          itemCount: veg_list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (BuildContext context, int index) {
            return new Product(
              veg_name: veg_list[index]['name'],
              veg_image: veg_list[index]['image'],
              veg_price: veg_list[index]['price'],
            );
          }),
    );
  }
}

class Product extends StatelessWidget {
  final veg_name;
  final veg_image;

  final veg_price;

  Product({
    this.veg_name,
    this.veg_image,
    this.veg_price,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: new Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: new Hero(
            tag: veg_name,
            child: new Material(
              child: new InkWell(
                onTap: () {
                  //We are passing the values from one activity to another activity
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetails(
                            productDetailsName: veg_name,
                            productDetailsImage: veg_image,
                            productDetailsNewPrice: veg_price,
                          ));
                  Navigator.of(context).push(route);
                },
                child: new GridTile(
                  footer: new Container(
                    color: Colors.white70,
                    child: new ListTile(
                      leading: new Text(
                        veg_name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      veg_image,
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
