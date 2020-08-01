import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:greeny_go/consumers/fruit.dart';
import 'package:greeny_go/consumers/grain.dart';
import 'package:greeny_go/consumers/veg.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 150.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'FOOD GRAINS',
                  style: TextStyle(fontSize: 8),
                ),
                new GestureDetector(
                  child: Image(
                    height: 110,
                    image: AssetImage('images/01.jpg'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Grains();
                    }));
                  },
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new GestureDetector(
                  child: Image(
                    height: 110,
                    image: AssetImage('images/03.jpg'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Fruits();
                    }));
                  },
                ),
              ],
            ),
          ),
          Card(
            elevation: 2.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new GestureDetector(
                  child: Image(
                    height: 110,
                    image: AssetImage('images/02.jpg'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Vegetables();
                    }));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  //Making
  Category({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(4.0),
      child: new InkWell(
        onTap: () {},
        child: new Container(
          width: 100.0,
          child: new ListTile(
            title: new Image.asset(
              image_location,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: new Container(
                alignment: Alignment.center,
                child: new Text(
                  image_caption,
                  style: new TextStyle(color: Colors.redAccent, fontSize: 14.0),
                )),
          ),
        ),
      ),
    );
  }
}
