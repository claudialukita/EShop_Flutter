import 'package:eshop_flutter/login/login_screen.dart';
import 'package:eshop_flutter/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        initialRoute: '/',
        routes: {'/': (context) => Splash(), '/login': (context) => Login()});
  }
}
