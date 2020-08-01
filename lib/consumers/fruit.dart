import 'package:flutter/material.dart';
import 'package:greeny_go/consumers/product_details.dart';

class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => new _FruitsState();
}

class _FruitsState extends State<Fruits> {
  var fruit_list = [
    {"name": "Orange", "image": "images/Orange.jpg", "price": "40"},
    {"name": "Banana", "image": "images/banana.jpg", "price": "80"},
    {"name": "Guava", "image": "images/Guava.jpg", "price": "50"},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Fruits',
        ),
      ),
      body: GridView.builder(
          itemCount: fruit_list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (BuildContext context, int index) {
            return new SingleProduct(
              fruit_name: fruit_list[index]['name'],
              fruit_image: fruit_list[index]['image'],
              fruit_price: fruit_list[index]['price'],
            );
          }),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final fruit_name;
  final fruit_image;

  final fruit_price;

  SingleProduct({
    this.fruit_name,
    this.fruit_image,
    this.fruit_price,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: new Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: new Hero(
            tag: fruit_name,
            child: new Material(
              child: new InkWell(
                onTap: () {
                  //We are passing the values from one activity to another activity
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetails(
                            productDetailsName: fruit_name,
                            productDetailsImage: fruit_image,
                            productDetailsNewPrice: fruit_price,
                          ));
                  Navigator.of(context).push(route);
                },
                child: new GridTile(
                  footer: new Container(
                    color: Colors.white70,
                    child: new ListTile(
                      leading: new Text(
                        fruit_name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      fruit_image,
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
