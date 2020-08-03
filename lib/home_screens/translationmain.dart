// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:greeny_go/home_screens/login.dart';
// import '../app_translations_delegate.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:greeny_go/home_screens/main_view.dart';

// import '../application.dart';

// void main() {
//   runApp(new LocalisedApp());
// }

// class LocalisedApp extends StatefulWidget {
//   @override
//   LocalisedAppState createState() => LocalisedAppState();
// }

// class LocalisedAppState extends State<LocalisedApp> {
//   AppTranslationsDelegate _newLocaleDelegate;

//   @override
//   void initState() {
//     super.initState();
//     _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
//     application.onLocaleChanged = onLocaleChange;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       localizationsDelegates: [
//         _newLocaleDelegate,
//         //provides localised strings
//         GlobalMaterialLocalizations.delegate,
//         //provides RTL support
//         GlobalWidgetsLocalizations.delegate,
//       ],
//       supportedLocales: [
//         const Locale("en", ""),
//         const Locale("hi", ""),
//         const Locale("tn", ""),
//       ],
//       theme: ThemeData(
//         // Define the default brightness and colors.
//         brightness: Brightness.light,
//         primaryColor: Colors.pinkAccent,
//       ),
//       routes: {
//         '/': (_) => MainView(),
//       },
//     );
//   }

//   void onLocaleChange(Locale locale) {
//     setState(() {
//       _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
//     });
//   }
// }
