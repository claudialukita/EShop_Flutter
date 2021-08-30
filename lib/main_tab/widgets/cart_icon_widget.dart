import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartIconWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var cartList = watch(cartProvider);
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 20,
            child: FittedBox(
              fit: BoxFit.cover,
              child: ImageIcon(
                AssetImage("assets/images/cart_icon.png"),
              ),
            ),
          ),
        ),
        (cartList is Success) ? Container(
          margin:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.13),
          width: 20,
          child: Positioned(
            // left: 11,
            // bottom: 11,
            right: 20,
            top: 0,
            child: new Container(
              padding: EdgeInsets.all(2),
              // alignment: Alignment.topCenter,
              decoration: new BoxDecoration(
                color: Color(0xFFFB7181),
                borderRadius: BorderRadius.circular(66),
              ),
              constraints: BoxConstraints(
                minWidth: 14,
                minHeight: 14,
              ),
              child: Text(
                cartList.data!.listCart.length.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
