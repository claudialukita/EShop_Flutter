import 'package:dotted_line/dotted_line.dart';
import 'package:eshop_flutter/cart/view_model/checkout_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_list_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_state_view_model.dart';
import 'package:eshop_flutter/cart/view_model/summary_view_model.dart';
import 'package:eshop_flutter/cart/widgets/cart_is_empty_widget.dart';
import 'package:eshop_flutter/cart/widgets/shoe_list_widget.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    var shoeListWtch = watch(shoeListViewModelProvider);
    var shoeStateWtch = watch(shoeStateViewModelProvider);
    return shoeStateWtch
        ? (shoeListWtch is DataIsEmpty)
            ? CartIsEmptyWidget()
            : (shoeListWtch is Success)
                ? ListView(children: <Widget>[
                    Column(
                      children: [
                        // removeShoe == "" ?
                        // shoeState ?
                        Container(
                          height: MediaQuery.of(context).size.height * 0.403,
                          child: ListView(
                            children: new List.generate(
                              shoeListWtch.data!.length,
                              (i) => new ListTileItem(
                                idx: i,
                                shoeId: shoeListWtch.data![i].shoeId,
                                subTotalItem:
                                    shoeListWtch.data![i].result.totalShoe,
                                shoeColor:
                                    shoeListWtch.data![i].result.shoeColor,
                                shoeSize: shoeListWtch.data![i].result.shoeSize,
                                shoeName: shoeListWtch.data![i].result.shoeName,
                                shoePrice:
                                    shoeListWtch.data![i].result.shoePrice,
                                shoeImageUrl:
                                    shoeListWtch.data![i].result.shoeImageUrl,
                              ),
                            ),
                          ),
                        ),
                        Consumer(
                          builder: (context, watch, child) {
                            var shoePriceWtch = watch(summaryModelProvider);
                            return (shoePriceWtch is Success)
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 8),
                                    padding: EdgeInsets.all(16),
                                    width: MediaQuery.of(context).size.width *
                                        380 /
                                        MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        164 /
                                        MediaQuery.of(context).size.height,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFEBF0FF)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "Items(${shoeListWtch.data!.length})",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                            Text(
                                                shoeStateWtch
                                                    ? "\$${shoePriceWtch.data!.subTotal}"
                                                    : "\$0",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .apply(
                                                        color:
                                                            Color(0xFF223263))),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Shipping",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                            Text(
                                                shoeStateWtch
                                                    ? "\$${shoePriceWtch.data!.shippingCost}"
                                                    : "\$0",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .apply(
                                                        color:
                                                            Color(0xFF223263))),
                                          ],
                                        ),
                                        SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Tax",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption),
                                            Text(
                                                shoeStateWtch
                                                    ? "\$${shoePriceWtch.data!.tax}"
                                                    : "\$0",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption!
                                                    .apply(
                                                        color:
                                                            Color(0xFF223263))),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Total Price",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .apply(
                                                        color:
                                                            Color(0xFF223263))),
                                            Text(
                                                // shoeState
                                                //     ?
                                                "\$${shoePriceWtch.data!.totalPrice}",
                                                // : "\$0",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3!
                                                    .apply(
                                                        color:
                                                            Color(0xFF40BFFF))),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                : CircularProgressIndicator();
                          },
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
                          child: Consumer(builder: (context, watch, child) {
                            var shoePriceWtch = watch(summaryModelProvider);
                            return (shoePriceWtch is Success)
                                ? ElevatedButton(
                                    onPressed: () => {
                                      context
                                          .read(checkoutViewModelProvider
                                              .notifier)
                                          .initialCheckout(
                                              shoeListWtch.data!, shoePriceWtch.data!),
                                      Navigator.pushNamed(
                                          context, '/DeliveryDetailScreen')
                                    },
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style,
                                    child: Text('Check Out',
                                        style:
                                            Theme.of(context).textTheme.button),
                                  )
                                : CircularProgressIndicator();
                          }),
                        ),
                      ],
                    ),
                  ])
                : CircularProgressIndicator()
        : CartIsEmptyWidget();
  }
}
