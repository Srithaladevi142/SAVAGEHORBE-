import 'package:flutter/material.dart';
import 'package:greeny_go/consumers/product_details.dart';

class Grains extends StatefulWidget {
  @override
  _GrainsState createState() => new _GrainsState();
}

class _GrainsState extends State<Grains> {
  var grain_list = [
    {"name": "paddy", "image": "images/Paddy.jpg", "price": "50"},
    {"name": "Wheat", "image": "images/Wheat.jpg", "price": "40"},
    {"name": "corn", "image": "images/Corn.jpg", "price": "30"},
    {"name": "Groundnut", "image": "images/Groundnut.jpg", "price": "50"},
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Grains'),
      ),
      body: GridView.builder(
          itemCount: grain_list.length,
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
          itemBuilder: (BuildContext context, int index) {
            return new SingleProduct(
              grain_name: grain_list[index]['name'],
              grain_image: grain_list[index]['image'],
              grain_price: grain_list[index]['price'],
            );
          }),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final grain_name;
  final grain_image;

  final grain_price;

  SingleProduct({
    this.grain_name,
    this.grain_image,
    this.grain_price,
  });

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
                onTap: () {
                  //We are passing the values from one activity to another activity
                  var route = new MaterialPageRoute(
                      builder: (BuildContext context) => ProductDetails(
                            productDetailsName: grain_name,
                            productDetailsImage: grain_image,
                            productDetailsNewPrice: grain_price,
                          ));
                  Navigator.of(context).push(route);
                },
                child: new GridTile(
                  footer: new Container(
                    color: Colors.white70,
                    child: new ListTile(
                      leading: new Text(
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
