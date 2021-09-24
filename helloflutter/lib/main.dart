import 'package:flutter/material.dart';
import 'package:helloflutter/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.red),
    );
  }
}
