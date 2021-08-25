import 'dart:math';

import 'package:eshop_flutter/product_detail/product_detail_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailWidget extends ConsumerWidget {
  String shoeId;
  ProductDetailWidget({required this.shoeId});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    print(shoeId);
    String shoeColor = "", shoeSize = "";
    return Container(
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
                  text:
                      "Nike Air Max 270 React ENG Nike Air Max 270 React ENG"),
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
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 20,
                      color: index == 4 ? Color(0xFFEBF0FF) : Color(0xFFFFC833),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("\$299,43",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.start),
          ),
          SizedBox(height: 24),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66),
                            border: Border.all(color: Color(0xFFEBF0FF)),
                          ),
                          child: new SizedBox(
                            child: FloatingActionButton(
                              heroTag: null,
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: Text(
                                index.toString(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              onPressed: ()
                              {
                                print("Cliked size ${index}");
                                shoeSize = "Cliked size ${index}";
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
          SizedBox(height: 24),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 16),
                          width: 48,
                          height: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(66),
                            border: Border.all(color: Color(0xFFEBF0FF)),
                          ),
                          child: new SizedBox(
                            child: FloatingActionButton(
                              heroTag: null,
                              elevation: 0,
                              backgroundColor: Color(
                                      (Random().nextDouble() * 0xFFFFFF)
                                          .toInt())
                                  .withOpacity(1.0),
                              child: Text(
                                index.toString(),
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              onPressed: () {
                                print("Cliked color ${index}");
                                shoeColor = "Cliked color ${index}";
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
                height: 80,
                alignment: Alignment.topLeft,
                child: Text(
                  "Shown:",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Container(
                width: (MediaQuery.of(context).size.width * 0.3),
                height: 80,
                child: RichText(
                  textAlign: TextAlign.end,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .apply(color: Color(0xFF9098B1)),
                      text:
                          "Nike Air Max 270 React ENG Nike Air Max 270 React ENG"),
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
                  "CD0113-400",
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
                  text:
                      "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience."),
            ),
          ),
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
                /*Navigator.pushNamed(context, '/CarsCard')*/
                context.read(productDetailViewModelProvider.notifier).addToCart(shoeColor, shoeSize, shoeId, "shoeName", 123.33, "shoeImageUrl")
              },
              style: Theme.of(context)
                  .elevatedButtonTheme
                  .style,
              child: Text('Add To Cart',
                  style:
                  Theme.of(context).textTheme.button),
            ),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
