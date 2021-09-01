import 'package:eshop_flutter/cart/cart_screen.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/home/home_screen.dart';
import 'package:eshop_flutter/main_tab/main_tab_view_model.dart';
import 'package:eshop_flutter/main_tab/widgets/cart_icon_widget.dart';
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
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(cartProvider.notifier).getCartList();
    });
    final _index = watch(mainTabViewModelProvider);
    return Scaffold(
        body: getScreen(_index),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 1,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Container(
                        width: 20,
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: ImageIcon(
                            AssetImage("assets/images/home_icon.png"),
                          ),
                        ),
                      ),
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      margin: EdgeInsets.only(bottom: 5),
                      child: CartIconWidget(),
                      // Icon(Icons.shopping_cart_outlined)
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Container(
                        width: 20,
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: ImageIcon(
                            AssetImage("assets/images/orders_icon.png"),
                          ),
                        ),
                      ),
                    ),
                    label: 'Orders'),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 35,
                      margin: EdgeInsets.only(bottom: 5),
                      child: Container(
                        width: 20,
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: ImageIcon(
                            AssetImage("assets/images/account_icon.png"),
                          ),
                        ),
                      ),
                    ),
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
              onTap: (int index) => context
                  .read(mainTabViewModelProvider.notifier)
                  .setTab(index)),
        ));
  }
}
