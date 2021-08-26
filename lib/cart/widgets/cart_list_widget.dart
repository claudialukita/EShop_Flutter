import 'package:dotted_line/dotted_line.dart';
import 'package:eshop_flutter/cart/view_model/remove_idx_view_model.dart';
import 'package:eshop_flutter/cart/view_model/remove_shoe_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_list_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_state_view_model.dart';
import 'package:eshop_flutter/cart/view_model/summary_view_model.dart';
import 'package:eshop_flutter/cart/widgets/cart_is_empty_widget.dart';
import 'package:eshop_flutter/cart/widgets/shoe_list_widget.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CarListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {

    var shoeList = watch(shoeListViewModelProvider);
    var shoePrice = watch(summaryModelProvider);
    var shoeState = watch(shoeStateViewModelProvider);

    return (shoeList is DataIsEmpty)
        ? CartIsEmptyWidget()
        : (shoeList is Success)
            ? ListView(children: <Widget>[
                Column(
                  children: [
                    // removeShoe == "" ?
                    // shoeState ?
                    Container(
                      height: MediaQuery.of(context).size.height * 0.403,
                      child: ListView(
                        children: new List.generate(
                          shoeList.data!.length,
                          (i) => new ListTileItem(
                            idx: i,
                            shoeId: shoeList.data![i].shoeId,
                            subTotalItem: shoeList.data![i].result.totalShoe,
                            shoeColor: shoeList.data![i].result.shoeColor,
                            shoeSize: shoeList.data![i].result.shoeSize,
                            shoeName: shoeList.data![i].result.shoeName,
                            shoePrice: shoeList.data![i].result.shoePrice,
                            shoeImageUrl: shoeList.data![i].result.shoeImageUrl,
                          ),
                        ),
                      ),
                    ),
                    // : Container(
                    //           height: MediaQuery.of(context).size.height * 0.403,
                    //         ),
                    (shoePrice is Success)
                        ?
                    // SummaryWidget(shoeItems: shoeList.data!.length,
                    //     subTotal: shoePrice.data!.subTotal,
                    //     shippingCost: shoePrice.data!.shippingCost,
                    //     tax: shoePrice.data!.tax,
                    //     totalPrice: shoePrice.data!.totalPrice,
                    //     shoesList: shoeList.data!,
                    // idx: removeIndex)
                    Container(
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
                              border: Border.all(color: Color(0xFFEBF0FF)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Items(${shoeList.data!.length})",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
                                    Text(
                                        shoeState
                                            ? "\$${shoePrice.data!.subTotal}"
                                            : "\$0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .apply(color: Color(0xFF223263))),
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
                                        shoeState
                                            ? "\$${shoePrice.data!.shippingCost}"
                                            : "\$0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .apply(color: Color(0xFF223263))),
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
                                        shoeState
                                            ? "\$${shoePrice.data!.tax}"
                                            : "\$0",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total Price",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .apply(color: Color(0xFF223263))),
                                    Text(
                                        // shoeState
                                        //     ?
                                        "\$${shoePrice.data!.totalPrice}",
                                            // : "\$0",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .apply(color: Color(0xFF40BFFF))),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : CircularProgressIndicator(),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF40BFFF).withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(1, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () => {
                          Navigator.pushNamed(context, '/DeliveryDetailScreen')
                        },
                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: Text('Check Out',
                            style: Theme.of(context).textTheme.button),
                      ),
                    ),
                  ],
                ),
              ])
            : CircularProgressIndicator();
  }
}

// class ListTileItem extends StatefulWidget {
//   int idx;
//   String shoeId;
//   String shoeColor;
//   int shoeSize;
//   String shoeName;
//   double shoePrice;
//   String shoeImageUrl;
//   int subTotalItem;
//
//   ListTileItem(
//       {required this.idx,
//       required this.shoeId,
//       required this.shoeColor,
//       required this.shoeSize,
//       required this.shoeName,
//       required this.shoePrice,
//       required this.shoeImageUrl,
//       required this.subTotalItem});
//   @override
//   _ListTileItemState createState() => new _ListTileItemState(
//       idx: idx,
//       shoeId: shoeId,
//       shoeColor: shoeColor,
//       shoeSize: shoeSize,
//       shoeName: shoeName,
//       shoePrice: shoePrice,
//       shoeImageUrl: shoeImageUrl,
//       subTotalItem: subTotalItem);
// }
//
// class _ListTileItemState extends State<ListTileItem> {
//   int idx;
//   String shoeId;
//   String shoeColor;
//   int shoeSize;
//   String shoeName;
//   double shoePrice;
//   String shoeImageUrl;
//   int subTotalItem;
//   _ListTileItemState(
//       {required this.idx,
//       required this.shoeId,
//       required this.shoeColor,
//       required this.shoeSize,
//       required this.shoeName,
//       required this.shoePrice,
//       required this.shoeImageUrl,
//       required this.subTotalItem});
//   int _itemCount = 1;
//   @override
//   Widget build(BuildContext context) {
//     return (_itemCount > 0)
//         ? Container(
//             margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//             width: MediaQuery.of(context).size.width *
//                 343 /
//                 MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height *
//                 126 /
//                 MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//               border: Border.all(color: Color(0xFFEBF0FF)),
//               borderRadius: BorderRadius.circular(5),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   child: Container(
//                     margin: EdgeInsets.all(16),
//                     height: 83,
//                     width: 83,
//                     // margin: EdgeInsets.symmetric(vertical: 20),
//                     decoration: BoxDecoration(
//                       color: Color(0xFFEBF0FF),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 0.58,
//                   margin: EdgeInsets.symmetric(vertical: 16),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.3,
//                             child: RichText(
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               text: TextSpan(
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .headline3!
//                                       .apply(color: Color(0xFF223263)),
//                                   text: shoeName),
//                             ),
//                           ),
//                           IconButton(
//                               padding: EdgeInsets.zero,
//                               constraints: BoxConstraints(),
//                               icon: Icon(Icons.delete_outline,
//                                   size: 20, color: Color(0xFF9098B1)),
//                               onPressed: () => {
//                                     context
//                                         .read(removeShoeViewModelProvider
//                                             .notifier)
//                                         .removeShoeFromCart(shoeId),
//                                     setState(() => _itemCount = 0),
//                                     context
//                                         .read(
//                                             shoeListViewModelProvider.notifier)
//                                         .getShoeCartList(),
//                                     context
//                                         .read(summaryModelProvider.notifier)
//                                         .getSummary(),
//                                 context
//                                         .read(shoeStateViewModelProvider.notifier)
//                                         .updateCartState(),
//                                   }),
//                         ],
//                       ),
//                       // SizedBox(height: 12),
//                       ListTile(
//                         contentPadding: EdgeInsets.all(0),
//                         title: Container(
//                           child: Text("\$${shoePrice}",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .headline3!
//                                   .apply(color: Color(0xFF40BFFF)),
//                               textAlign: TextAlign.start),
//                         ),
//                         trailing: FittedBox(
//                           fit: BoxFit.cover,
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: <Widget>[
//                               Container(
//                                 height: 25,
//                                 width: 30,
//                                 padding: EdgeInsets.all(0),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xFFEBF0FF)),
//                                   borderRadius: new BorderRadius.only(
//                                     topLeft: const Radius.circular(5.0),
//                                     bottomLeft: const Radius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: _itemCount != 1
//                                     ? IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: BoxConstraints(),
//                                         icon: Icon(Icons.remove,
//                                             size: 15, color: Color(0xFF9098B1)),
//                                         onPressed: () =>
//                                             setState(() => _itemCount--),
//                                       )
//                                     : Icon(Icons.remove,
//                                         size: 15, color: Color(0xFF9098B1)),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.all(0),
//                                 alignment: Alignment.center,
//                                 height: 25,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                     border:
//                                         Border.all(color: Color(0xFFEBF0FF)),
//                                     color: Color(0xFFEBF0FF)),
//                                 child: Text(
//                                     subTotalItem > _itemCount
//                                         ? subTotalItem.toString()
//                                         : _itemCount.toString(),
//                                     style:
//                                         Theme.of(context).textTheme.subtitle2),
//                               ),
//                               Container(
//                                 height: 25,
//                                 width: 30,
//                                 padding: EdgeInsets.all(0),
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Color(0xFFEBF0FF)),
//                                   borderRadius: new BorderRadius.only(
//                                     topRight: const Radius.circular(5.0),
//                                     bottomRight: const Radius.circular(5.0),
//                                   ),
//                                 ),
//                                 child: IconButton(
//                                     padding: EdgeInsets.zero,
//                                     constraints: BoxConstraints(),
//                                     icon: Icon(Icons.add,
//                                         size: 15, color: Color(0xFF9098B1)),
//                                     onPressed: () =>
//                                         setState(() => _itemCount++)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         : Container();
//   }
// }
