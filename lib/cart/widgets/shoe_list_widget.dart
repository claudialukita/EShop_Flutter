import 'package:eshop_flutter/cart/view_model/remove_shoe_view_model.dart';
import 'package:eshop_flutter/cart/view_model/shoe_list_view_model.dart';
import 'package:eshop_flutter/main_tab/main_tab_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListTileItem extends StatefulWidget {
  int idx;
  String shoeId;
  String shoeColor;
  int shoeSize;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  int subTotalItem;

  ListTileItem(
      {required this.idx,
        required this.shoeId,
        required this.shoeColor,
        required this.shoeSize,
        required this.shoeName,
        required this.shoePrice,
        required this.shoeImageUrl,
        required this.subTotalItem});
  @override
  _ListTileItemState createState() => new _ListTileItemState(
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
  int idx;
  String shoeId;
  String shoeColor;
  int shoeSize;
  String shoeName;
  double shoePrice;
  String shoeImageUrl;
  int subTotalItem;
  _ListTileItemState(
      {required this.idx,
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
      child: Row(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.all(16),
              height: 83,
              width: 83,
              // margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFFEBF0FF),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(shoeImageUrl), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.58,
            margin: EdgeInsets.symmetric(vertical: 16),
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
                            text: shoeName),
                      ),
                    ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.delete_outline,
                            size: 20, color: Color(0xFF9098B1)),
                        onPressed: () => {
                          context
                              .read(removeShoeViewModelProvider
                              .notifier)
                              .removeShoeFromCart(shoeId),
                          setState(() => subTotalItem = 0),
                          // context
                          //     .read(shoeStateViewModelProvider.notifier)
                          //     .updateCartState(),
                          context.read(mainTabViewModelProvider.notifier).setTab(1),
                        }),
                  ],
                ),
                // SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Container(
                    child: Text("\$${shoePrice}",
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .apply(color: Color(0xFF40BFFF)),
                        textAlign: TextAlign.start),
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
                            border: Border.all(color: Color(0xFFEBF0FF)),
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
                                size: 15, color: Color(0xFF9098B1)),
                            onPressed: () => {
                                setState(() => {subTotalItem--, print("coba: rmv count ${subTotalItem}")}),
                              context
                                  .read(shoeListViewModelProvider.notifier)
                                  .updateShoeCartList(shoeId, subTotalItem),
                              context.read(mainTabViewModelProvider.notifier).setTab(1),
                              print("coba: remove"),

                            }

                          )
                              : Icon(Icons.remove,
                              size: 15, color: Color(0xFF9098B1)),
                        ),
                        Container(
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          height: 25,
                          width: 30,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Color(0xFFEBF0FF)),
                              color: Color(0xFFEBF0FF)),
                          child: Text(
                              subTotalItem.toString(),
                              style:
                              Theme.of(context).textTheme.subtitle2),
                        ),
                        Container(
                          height: 25,
                          width: 30,
                          padding: EdgeInsets.all(0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFEBF0FF)),
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
                                  setState(() => {subTotalItem++, print("coba: add count ${subTotalItem}")}),
                                context
                                    .read(shoeListViewModelProvider.notifier)
                                    .updateShoeCartList(shoeId, subTotalItem),
                                context.read(mainTabViewModelProvider.notifier).setTab(1),
                                print("coba: add"),

                              }
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
      ),
    )
        : Container();
  }
}