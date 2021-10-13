import 'package:flutter/material.dart';
import 'package:helloflutter/core/store.dart';
import 'package:helloflutter/pages/cart_page.dart';
import 'package:helloflutter/pages/home_page.dart';
import 'package:helloflutter/pages/login_page.dart';
import 'package:helloflutter/utils/routes.dart';
import 'package:helloflutter/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: Mystore(),
    child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage()
      },
    );
  }
}
