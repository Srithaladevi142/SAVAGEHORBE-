import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _YourStoryState createState() => _YourStoryState();
}

class _YourStoryState extends State<Payment>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: Text('PAYMENT'),
          backgroundColor: Colors.teal,
          bottom: TabBar(
            controller: controller,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.history),
              ),
              Tab(
                icon: Icon(Icons.payment),
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 120),
                  child: Text('PAYMENT HISTORY',style: TextStyle(fontSize: 20),),
                ),
                ListTile(
                  title: Text('Carrot'),
                  subtitle: Text('12 Kgs'),
                  trailing: Text('Rs: 150'),
                ),
                ListTile(
                  title: Text('Tomato'),
                  subtitle: Text('20 Kgs'),
                  trailing: Text('Rs: 250'),
                ),
                ListTile(
                  title: Text('Garlic'),
                  subtitle: Text('7 Kgs'),
                  trailing: Text('Rs: 90 '),
                )
              ],
            ),
            ListView(
              children: <Widget>[
                 Padding(
                  padding: const EdgeInsets.only(top: 30,left: 120),
                  child: Text('CURRENT PAYMENT',style: TextStyle(fontSize: 20),),
                ),

                // ListTile(
                //   title: Text('tomato'),
                //   subtitle: Text('12 Kgs'),
                // )
              ],
            )
          ],
        ),
      ),
      length: 12,
    );
  }
}
