import 'package:flutter/material.dart';

class Notifcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFICATION'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.person),
              title: Text('HARIHARAN'),
              subtitle: Text('Ordered 30kgs of Tomato'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('KARAN'),
              subtitle: Text('Ordered 40kgs of Wheat'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('PRAKASH'),
              subtitle: Text('Ordered 30kgs of Onion'),
            ),
          ],
        ),
      ),
    );
  }
}
