import 'package:eshop_flutter/card_detail/card_detail_screen.dart';
import 'package:eshop_flutter/commit_order/commit_order_screen.dart';
import 'package:eshop_flutter/login/login_screen.dart';
import 'package:eshop_flutter/main_tab/main_tab_screen.dart';
import 'package:eshop_flutter/order/detail/order_detail_screen.dart';
import 'package:eshop_flutter/product_detail/product_detail_screen.dart';
import 'package:eshop_flutter/product_detail/widgets/success_add_widget.dart';
import 'package:eshop_flutter/product_search/product_search_screen.dart';
import 'package:eshop_flutter/sign_in/sign_in_screen.dart';
import 'package:eshop_flutter/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'delivery_detail/delivery_detail_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
            headline2: TextStyle(
                fontSize: 21, color: Colors.white, fontWeight: FontWeight.w700),
            headline3: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700),
            headline4: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700),
            headline5: TextStyle(
                fontSize: 21, color: Color(0xFF223263), fontWeight: FontWeight.w700),
            headline6: TextStyle(
                fontSize: 21,
                color: Color(0xFF40BFFF),
                fontWeight: FontWeight.w700),
            bodyText2: TextStyle(fontSize: 12, color: Colors.white),
            caption: TextStyle(fontSize: 12, color: Color(0xFF9098B1)),
            subtitle1: TextStyle(
                fontSize: 14,
                color: Color(0xFF223263),
                fontWeight: FontWeight.w700),
            subtitle2: TextStyle(
                fontSize: 12,
                color: Color(0xFF223263),
                fontWeight: FontWeight.w700),
            bodyText1: TextStyle(
                fontSize: 12, color: Color(0xFF223263), letterSpacing: 0.5),
            button: TextStyle(
                fontSize: 14,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              primary: Color(0xFF40BFFF),
              minimumSize: Size(343, 57),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 3,
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        // navigatorObservers: [
        //   FirebaseAnalyticsObserver(analytics: context.read(analyticsProvider)),
        // ],
        routes: {
          '/': (context) => Splash(),
          '/login': (context) => SignInScreen(),
          // '/login': (context) => Login(),
          '/MainTabScreen': (context) => MainTabScreen(),
          '/ProductSearchScreen': (context) => ProductSearchScreen(),
          '/ProductDetailScreen': (context) => ProductDetailScreen(),
          '/DeliveryDetailScreen': (context) => DeliveryDetailScreen(),
          '/CardDetailScreen': (context) => CardDetailScreen(),
          '/CommitOrderScreen': (context) => CommitOrderScreen(),
          '/SuccessAddWidget': (context) => SuccessAddWidget(),
          '/OrderDetails': (context) => OrderDetail()
          // '/CounterScreen': (context) => FlutterExample(),
        });
  }
}
