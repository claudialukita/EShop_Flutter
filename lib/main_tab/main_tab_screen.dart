import 'package:eshop_flutter/cart/cart_screen.dart';
import 'package:eshop_flutter/home/home_screen.dart';
import 'package:eshop_flutter/main_tab/main_tab_view_model.dart';
import 'package:eshop_flutter/order/order_screen.dart';
import 'package:eshop_flutter/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainTabScreen extends ConsumerWidget {

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CartScreen();
      case 2:
        return OrderScreen();
      case 3:
        return Profile();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _index = watch(mainTabViewModelProvider);

    return Scaffold(
      body: getScreen(_index),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 1,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                    height: 18,
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.home_outlined)),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                    height: 18,
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.shopping_cart_outlined)),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Container(
                    height: 18,
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.local_offer_outlined)),
                label: 'Offer'),
            BottomNavigationBarItem(
                icon: Container(
                    height: 18,
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(Icons.person_outline)),
                label: 'Account')
          ],
          selectedLabelStyle: TextStyle(
              fontSize: 10,
              color: Color(0xFF40BFFF),
              fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              TextStyle(fontSize: 10, color: Color(0xFF9098B1)),
          currentIndex: _index,
          selectedItemColor: Color(0xFF40BFFF),
          unselectedItemColor: Color(0xFF9098B1),
          onTap: (int index) =>
              context.read(mainTabViewModelProvider.notifier).setTab(index)),
    );
  }
}
