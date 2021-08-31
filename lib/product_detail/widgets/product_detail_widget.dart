import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/core/providers/currency_number_provider.dart';
import 'package:eshop_flutter/product_detail/view_model/color_available_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/color_state_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/product_detail_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/size_state_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var shoeDetail = watch(productDetailViewModelProvider);
    var cartList = watch(cartProvider);
    var colorAvailable = watch(colorAvailableViewModelProvider);
    return (shoeDetail is Success)
        ? Container(
            padding: EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: Theme.of(context).textTheme.headline5,
                        text: shoeDetail.data!.name),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, indexStar) {
                      return Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: indexStar == shoeDetail.data!.rating
                                ? Color(0xFFEBF0FF)
                                : Color(0xFFFFC833),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      "\$${currencyNumber.format(shoeDetail.data!.price)}",
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.start),
                ),
                SizedBox(height: 24),
                Consumer(
                  builder: (context, watch, widget) {
                    var stateSize = watch(sizeViewModelProvider);
                    print(stateSize);
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Select Size",
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.start),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: shoeDetail.data!.shoeSizes.length,
                                itemBuilder: (context, indexSize) {
                                  shoeDetail.data!.shoeSizes.sort();
                                  return Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 16),
                                        width: 48,
                                        height: 48,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          border: Border.all(
                                              color: stateSize == indexSize
                                                  ? Color(0xFF40BFFF)
                                                  : Color(0xFFEBF0FF)),
                                        ),
                                        child: new SizedBox(
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            elevation: 0,
                                            backgroundColor: Colors.transparent,
                                            child: Text(
                                              shoeDetail
                                                  .data!.shoeSizes[indexSize]
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle2,
                                            ),
                                            onPressed: () => {
                                              context
                                                  .read(sizeViewModelProvider
                                                      .notifier)
                                                  .selectSize(indexSize),
                                              context
                                                  .read(
                                                      colorAvailableViewModelProvider
                                                          .notifier)
                                                  .loadColorAvailable(
                                                      shoeDetail.data,
                                                      shoeDetail.data!
                                                          .shoeSizes[indexSize])
                                              // print("Cliked size ${i    .data!.shoeSizes[indexSize]ndex}");
                                              // shoeSize = "Cliked size ${index}";
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24),
                Consumer(
                  builder: (context, watch, widget) {
                    var stateColor = watch(colorViewModelProvider);
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("Select Color",
                              style: Theme.of(context).textTheme.subtitle1,
                              textAlign: TextAlign.start),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: (colorAvailable is Success)
                                    ? colorAvailable.data!.length
                                    : shoeDetail.data!.shoeColors.length,
                                itemBuilder: (context, indexColor) {
                                  return Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 16),
                                        width: 48,
                                        height: 48,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(66),
                                          border: Border.all(
                                              color: Color(0xFFEBF0FF)),
                                        ),
                                        child: new SizedBox(
                                          child: FloatingActionButton(
                                            heroTag: null,
                                            elevation: 0,
                                            backgroundColor: Color(
                                                (colorAvailable is Success)
                                                    ? colorAvailable
                                                        .data![indexColor]
                                                    : shoeDetail
                                                            .data!.shoeColors[
                                                        indexColor]),
                                            child: stateColor == indexColor
                                                ? Container(
                                                    width: 16,
                                                    height: 16,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFFFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              66),
                                                    ),
                                                  )
                                                : Container(),
                                            onPressed: () => {
                                              context
                                                  .read(colorViewModelProvider
                                                      .notifier)
                                                  .selectColor(indexColor),
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 24),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Specification",
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.start),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Shown:",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.3),
                      height: 40,
                      child: RichText(
                        textAlign: TextAlign.end,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .apply(color: Color(0xFF9098B1)),
                            text: shoeDetail.data!.name),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Style:",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.3),
                      alignment: Alignment.centerRight,
                      child: Text(
                        shoeDetail.data!.productCode,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .apply(color: Color(0xFF9098B1)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: (MediaQuery.of(context).size.width),
                  height: 80,
                  child: RichText(
                    textAlign: TextAlign.start,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .apply(color: Color(0xFF9098B1)),
                        text: shoeDetail.data!.description),
                  ),
                ),
                Consumer(
                  builder: (context, watch, widget) {
                    var stateSize = watch(sizeViewModelProvider);
                    var stateColor = watch(colorViewModelProvider);
                    return Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF40BFFF).withOpacity(0.5),
                            spreadRadius: 7,
                            blurRadius: 10,
                            offset: Offset(0, 7),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: stateSize >= 0 && stateColor >= 0
                            ? () => {
                                  context
                                      .read(cartProvider.notifier)
                                      .addToCartList(
                                          (cartList is Initial)
                                              ? null
                                              : cartList.data!,
                                          shoeDetail.data!,
                                          colorAvailable.data![stateColor],
                                          shoeDetail.data!.shoeSizes[stateSize],
                                          shoeDetail.data!.name,
                                          shoeDetail.data!.price,
                                          shoeDetail.data!.imageUrls[0]),
                                  Navigator.pushReplacementNamed(
                                      context, '/SuccessAddWidget',
                                      arguments: shoeDetail.data!.name),
                                }
                            : () => {},
                        style: stateSize >= 0 && stateColor >= 0
                            ? Theme.of(context).elevatedButtonTheme.style
                            : ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                primary: Color(0xFFEBF0FF).withOpacity(0.3),
                                fixedSize: Size(343, 57),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                elevation: 3,
                              ),
                        child: Text('Add To Cart',
                            style: Theme.of(context).textTheme.button),
                      ),
                    );
                  },
                ),
                SizedBox(height: 50)
              ],
            ),
          )
        : Container();
  }
}
