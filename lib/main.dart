import 'package:flutter/material.dart';

import 'package:bithm/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final String title = "Bithm";

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightGreen[800],
        fontFamily: 'Monserrat'
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: HomePage(title: title),
    );
  }
}
