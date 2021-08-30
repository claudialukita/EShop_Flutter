import 'package:dotted_line/dotted_line.dart';
import 'package:eshop_flutter/cart/widgets/cart_is_empty_widget.dart';
import 'package:eshop_flutter/cart/widgets/shoe_list_widget.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/providers/cart_init_checkout_provider.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/core/providers/currency_number_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var cartState = watch(cartProvider);
    return (cartState is Initial)
        ? CartIsEmptyWidget()
        : (cartState is Success)
            ? ListView(
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.403,
                        child: ListView(
                          children: new List.generate(
                            cartState.data!.listCart.length,
                            (i) => new ListTileItem(
                              summaryCart: cartState.data!,
                              idx: i,
                              shoeId: cartState.data!.listCart[i].shoeId,
                              subTotalItem:
                                  cartState.data!.listCart[i].result.totalShoe,
                              shoeColor:
                                  cartState.data!.listCart[i].result.shoeColor,
                              shoeSize:
                                  cartState.data!.listCart[i].result.shoeSize,
                              shoeName:
                                  cartState.data!.listCart[i].result.shoeName,
                              shoePrice:
                                  cartState.data!.listCart[i].result.shoePrice,
                              shoeImageUrl: cartState
                                  .data!.listCart[i].result.shoeImageUrl,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width *
                            380 /
                            MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height *
                            164 /
                            MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFEBF0FF)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    "Items(${cartState.data!.listCart.length})",
                                    style: Theme.of(context).textTheme.caption),
                                Text(
                                    "\$${currencyNumber.format(cartState.data!.summary.subTotal)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .apply(color: Color(0xFF223263))),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shipping",
                                    style: Theme.of(context).textTheme.caption),
                                Text(
                                    "\$${currencyNumber.format(cartState.data!.summary.shippingCost)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .apply(color: Color(0xFF223263))),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Tax",
                                    style: Theme.of(context).textTheme.caption),
                                Text(
                                    "\$${currencyNumber.format(cartState.data!.summary.tax)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .apply(color: Color(0xFF223263))),
                              ],
                            ),
                            SizedBox(height: 12),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: double.infinity,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Color(0xFFEBF0FF),
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Price",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .apply(color: Color(0xFF223263))),
                                Text(
                                    "\$${currencyNumber.format(cartState.data!.summary.totalPrice)}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .apply(color: Color(0xFF40BFFF))),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF40BFFF).withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset:
                                  Offset(1, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () => {
                            context
                                .read(cartInitCheckoutProvider.notifier)
                                .initialCheckout(cartState.data!),
                            Navigator.pushNamed(
                                context, '/DeliveryDetailScreen')
                          },
                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: Text('Check Out',
                              style: Theme.of(context).textTheme.button),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : CircularProgressIndicator();
  }
}
