import 'package:flutter/material.dart';

import 'package:greeny_go/consumers/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => new _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {"name": "Carrot", "image": "images/image4.jpg", "price": "60"},
    {"name": "Tomato", "image": "images/image5.jpg", "price": "40"},
    {"name": "Garlic", "image": "images/image7.jpg", "price": "80"},
    {"name": "Potato", "image": "images/image8.jpg", "price": "50"},
  ];

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return new SingleProduct(
            prod_name: product_list[index]['name'],
            prod_image: product_list[index]['image'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_image;

  final prod_price;

  SingleProduct({
    this.prod_name,
    this.prod_image,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
      child: new Card(
        elevation: 6.0,
        color: Colors.cyanAccent,
        child: new Hero(
            tag: prod_name,
            child: new Material(
              child: new InkWell(
                onTap: () {
                  //We are passing the values from one activity to another activity
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetails(
                            productDetailsName: prod_name,
                            productDetailsImage: prod_image,
                            productDetailsNewPrice: prod_price,
                          ));
                  Navigator.of(context).push(route);
                },
                child: new GridTile(
                  footer: new Container(
                    color: Colors.white70,
                    child: new ListTile(
                      leading: new Text(
                        prod_name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: new Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Image.asset(
                      prod_image,
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
