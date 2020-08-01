import 'package:greeny_go/home_screens/login.dart';
import 'package:greeny_go/home_screens/main_view.dart';
import 'package:flutter/material.dart';
import 'home_screens/home_page.dart';
import 'home_screens/navigation_screens/myhome.dart';
import 'home_screens/drawer_items/my_orders.dart';
import 'splash.dart';
import 'user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ScreensController(),
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            canvasColor: Colors.white,
            accentColor: Colors.red),
        routes: <String, WidgetBuilder>{
          '/a': (BuildContext context) => MainView(),
          '/b': (BuildContext context) => MyHome(),
          '/homePage': (BuildContext context) => HomePage(),
          '/myOrders': (BuildContext context) => MyOrders(),
          '/loginpage': (BuildContext context) => LoginPage(),
        },
      )));
}

const languages = const [
  const Language('English', 'en_US'),
  const Language('தமிழ்', 'tn_in'),
  const Language('हिन्दी', 'hi_in'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginPage();
      case Status.Authenticated:
        return MyHome();
      default:
        return LoginPage();
    }
  }
}
