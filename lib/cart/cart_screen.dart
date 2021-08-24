import 'package:eshop_flutter/cart/widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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


      // SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       CarListWidget(),
      //       // SummaryWidget(title: "coba title", name: "coba name"),
      //     ],
      //   ),
      // ),
    );
  }
}
