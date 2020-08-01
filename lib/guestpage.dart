import 'package:flutter/material.dart';
import 'package:greeny_go/Warehouse.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DETAIL PAGE'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                title: Text('KARAN'),
                subtitle: Text('Pacs-Ranimookanoor'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   return WareHouse();
                  // }));
                },
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    _launchCall();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                title: Text('pacs-ranimookanoor'),
                subtitle: Text('karan'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   return WareHouse();
                  // }));
                },
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // _launchCall();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: ListTile(
                title: Text('pacs-ranimookanoor'),
                subtitle: Text('karan'),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (BuildContext context) {
                  //   return WareHouse();
                  // }));
                },
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // _launchCall();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

_launchCall() async {
  const url = 'tel:9876543210';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
