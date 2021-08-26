import 'package:eshop_flutter/cart/view_model/shoe_list_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_state_view_model.dart';
import 'package:eshop_flutter/cart/view_model/summary_view_model.dart';
import 'package:eshop_flutter/cart/widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(shoeListViewModelProvider.notifier).getShoeCartList();
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(summaryModelProvider.notifier).getSummary();
    });
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(shoeStateViewModelProvider.notifier).initialCartState();
    });


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.all(20),
          // height: 45,
          child: Text(
            "Your Cart",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .apply(color: Color(0xFF223263)),
          ),
        ),
      ),
      body: CarListWidget(),

    );
  }
}
