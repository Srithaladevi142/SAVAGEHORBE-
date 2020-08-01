import 'package:flutter/material.dart';
import 'package:greeny_go/payment.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY ACCOUNT'),
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'LOGGED IN AS',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  maxRadius: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'SRITHALADEVI',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('LOGIN & SECURITY'),
                  // dense: true,
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.arrow_forward_ios),
                  // dense: true,
                  title: Text('YOUR ADDRESS'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  onTap: () {},
                  // dense: true,
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('CONTENT AND DEVICES'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  onTap: () {},
                  // dense: true,
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('PURCHASE SETTINGS'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  onTap: () {},
                  // dense: true,
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('REVIEW YOUR PURCHASES'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return Payment();
                    }));
                  },
                  // dense: true,
                  trailing: Icon(Icons.arrow_forward_ios),
                  title: Text('PAY'),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
