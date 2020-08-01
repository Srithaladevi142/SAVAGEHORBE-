import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Column(children: <Widget>[
        ExpansionTile(
          title: Text("Credit Card"),
          trailing: Icon(Icons.arrow_drop_down),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter the card name'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter the card number'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter the cvv'),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Enter the Expiry MM/YY'),
            ),
            new MaterialButton(
                child: new Text("Make Payment"),
                color: Colors.pinkAccent,
                textColor: Colors.white,
                onPressed: () {
                  Fluttertoast.showToast(
                      msg: "Payment Succeeded",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fontSize: 14.0);
                }),
          ],
        ),
        ExpansionTile(
          title: Text("Net Banking"),
          trailing: Icon(Icons.arrow_drop_down),
        ),
        ExpansionTile(
          title: Text("Paypal"),
          trailing: Icon(Icons.arrow_drop_down),
        ),
      ]),
    );
  }
}
