import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[ SizedBox(
              height: 350,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Card(
                    elevation: 2.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                       
                        Text(
                          "TNWC",
                         
                        ),
                        
                        Padding(
                          padding: EdgeInsets.only(),
                          child: Text("Tomato"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.pink,
                            child: Text(
                              "Get more details",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Consolas',
                                  fontSize: 10.0),
  )),
                            ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),],
          ),
        ));
  }
}