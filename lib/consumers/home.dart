import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:greeny_go/consumers/subs_screen.dart';

import 'cart.dart';
import 'chat.dart';
import 'myhome.dart';
import 'mywallet.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MyHomePage _home;
  ScbsPage _subsPage;
  MyWallet _myWallet;
  Chats _chats;

  List<Widget> pages;
  Widget currentPage = MyHomePage();

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontFamily: 'Consolas', fontSize: 13, fontWeight: FontWeight.normal);

  @override
  void initState() {
    _home = MyHomePage();
    _subsPage = ScbsPage();
    _myWallet = MyWallet();
    _chats = Chats();

    pages = [_home, _subsPage, _myWallet, _chats];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text(
              'Home',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            title: Text(
              'Subscription',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            title: Text(
              'My wallet',
              style: optionStyle,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text(
              'Chat',
              style: optionStyle,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.pinkAccent,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
            currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          ),
          new IconButton(
              icon: new Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Cart();
                }));
              }),
        ],
        title: Text(
          'Home',
          style: TextStyle(fontFamily: 'Consolas'),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'srithala',
                style: TextStyle(fontFamily: 'Consolas'),
              ),
              accountEmail: Text(
                'srithaladevi@gmail.com',
                style: TextStyle(fontFamily: 'Consolas'),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'S',
                  style: TextStyle(
                    fontFamily: 'Consolas',
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }));
              },
            ),
            ListTile(
              title: Text(
                'My Account',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.account_circle),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Notification',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.notifications_active),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
                title: Text(
                  'My Order',
                  style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
                ),
                leading: Icon(Icons.beenhere),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushReplacementNamed('/myOrders');
                }),
            ListTile(
              title: Text(
                'Your Story',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.content_paste),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Rate our App',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.star),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Need Help?',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.help_outline),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Share',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.share),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.settings),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(fontFamily: 'Consolas', fontSize: 15.0),
              ),
              leading: Icon(Icons.input),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final items = [
    'Grain',
    'Fruits',
    'Vegitable',
  ];
  final recentItems = ['Grain', 'Fruits', 'Vegitable'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggetionList = query.isEmpty
        ? recentItems
        : items.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.arrow_forward_ios),
        title: RichText(
          text: TextSpan(
              text: suggetionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggetionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey))
              ]),
        ),
      ),
      itemCount: suggetionList.length,
    );
  }
}
