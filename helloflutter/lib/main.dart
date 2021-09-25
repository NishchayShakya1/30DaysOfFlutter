import 'package:flutter/material.dart';
import 'package:helloflutter/pages/home_page.dart';
import 'package:helloflutter/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red),
      // initialRoute: "/login",this is to set the initial route.
      routes: {
        "/": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
