import 'package:flutter/material.dart';

class Manoj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'ERODE',
                style: TextStyle(fontSize: 23),
              ),
            ),
            Image.asset(
              'images/sathy.jpg',
              height: 400,
            ),
            Text('ERODE',style: TextStyle(fontSize: 23),),
            Text(
                '                 Erode is a city in the Kongunadu region and seventh largest urban agglomeration in Tamil Nadu, India. It serves as the administrative headquarters of the Erode district. Administered by a municipal corporation since 2009, Erode is a part of the Erode Lok Sabha constituency that elects its member of parliament. Located on the banks of River Kaveri, it is situated centrally on South Indian Peninsula, about 400 kilometres')
          ],
        ),
      ),
    );
  }
}
