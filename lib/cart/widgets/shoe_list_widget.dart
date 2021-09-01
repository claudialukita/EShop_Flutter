import 'package:eshop_flutter/core/models/cart.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/core/providers/currency_number_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTileItem extends StatefulWidget {
  SummaryCart summaryCart;
  int idx;
  String shoeId;
  int shoeColor;
  int shoeSize;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  int subTotalItem;

  ListTileItem(
      {required this.summaryCart,
      required this.idx,
      required this.shoeId,
      required this.shoeColor,
      required this.shoeSize,
      required this.shoeName,
      required this.shoePrice,
      required this.shoeImageUrl,
      required this.subTotalItem});
  @override
  _ListTileItemState createState() => new _ListTileItemState(
      summaryCart: summaryCart,
      idx: idx,
      shoeId: shoeId,
      shoeColor: shoeColor,
      shoeSize: shoeSize,
      shoeName: shoeName,
      shoePrice: shoePrice,
      shoeImageUrl: shoeImageUrl,
      subTotalItem: subTotalItem);
}

class _ListTileItemState extends State<ListTileItem> {
  SummaryCart summaryCart;
  int idx;
  String shoeId;
  int shoeColor;
  int shoeSize;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  int subTotalItem;
  _ListTileItemState(
      {required this.summaryCart,
      required this.idx,
      required this.shoeId,
      required this.shoeColor,
      required this.shoeSize,
      required this.shoeName,
      required this.shoePrice,
      required this.shoeImageUrl,
      required this.subTotalItem});
  // int _itemCount = 1;
  @override
  Widget build(BuildContext context) {
    // _itemCount = subTotalItem++;
    return (subTotalItem > 0)
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width *
                343 /
                MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height *
                126 /
                MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFEBF0FF)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Consumer(
              builder: (context, watch, widget) {
                var cartStateUpdate = watch(cartProvider);

                return Row(
                  children: [
                    Container(
                      child: Container(
                        margin: EdgeInsets.all(16),
                        height: 90,
                        width: 90,
                        // margin: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFEBF0FF),
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(cartStateUpdate.data!.listCart[idx].result.shoeImageUrl),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    // SizedBox(width: 16),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.58,
                      margin: EdgeInsets.only(right: 16, top: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .apply(color: Color(0xFF223263)),
                                      text: cartStateUpdate.data!.listCart[idx].result.shoeName),
                                ),
                              ),
                              IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(),
                                  icon: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    width: 17.75,
                                    height: 20,
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      child: ImageIcon(
                                        AssetImage("assets/images/trash_icon.png"),
                                        color: Color(0xFF9098B1),
                                      ),
                                    ),
                                  ),
                                  // Icon(Icons.delete_outline,
                                  //     size: 20, color: Color(0xFF9098B1)),
                                  onPressed: () => {
                                        context
                                            .read(cartProvider.notifier)
                                            .removeShoe(summaryCart, idx),
                                        setState(() => {}),
                                      }),
                            ],
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Container(
                              child:
                                  Text(
                                      "\$${currencyNumber.format(cartStateUpdate.data!.listCart[idx].result.shoePrice)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .apply(color: Color(0xFF40BFFF)),
                                      textAlign: TextAlign.start),
                              // })
                            ),
                            trailing: FittedBox(
                              fit: BoxFit.cover,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    height: 25,
                                    width: 30,
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFEBF0FF)),
                                      borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(5.0),
                                        bottomLeft: const Radius.circular(5.0),
                                      ),
                                    ),
                                    child: subTotalItem != 1
                                        ? IconButton(
                                            padding: EdgeInsets.zero,
                                            constraints: BoxConstraints(),
                                            icon: Icon(Icons.remove,
                                                size: 15,
                                                color: Color(0xFF9098B1)),
                                            onPressed: () => {
                                                  setState(() => {
                                                        subTotalItem--,
                                                      }),
                                                  context
                                                      .read(
                                                          cartProvider.notifier)
                                                      .updateCartList(
                                                          summaryCart,
                                                          subTotalItem,
                                                          shoeColor,
                                                          shoeSize,
                                                          shoeId,
                                                          shoeName,
                                                          shoePrice,
                                                          shoeImageUrl),
                                                })
                                        : Icon(Icons.remove,
                                            size: 15, color: Color(0xFF9098B1)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    height: 25,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFFEBF0FF)),
                                        color: Color(0xFFEBF0FF)),
                                    child: Text(subTotalItem.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 30,
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFEBF0FF)),
                                      borderRadius: new BorderRadius.only(
                                        topRight: const Radius.circular(5.0),
                                        bottomRight: const Radius.circular(5.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: BoxConstraints(),
                                      icon: Icon(Icons.add,
                                          size: 15, color: Color(0xFF9098B1)),
                                      onPressed: () => {
                                        setState(() => {
                                              subTotalItem++,
                                            }),
                                        context
                                            .read(cartProvider.notifier)
                                            .updateCartList(
                                                summaryCart,
                                                subTotalItem,
                                                shoeColor,
                                                shoeSize,
                                                shoeId,
                                                shoeName,
                                                shoePrice,
                                                shoeImageUrl),
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        : Container();
  }
}
