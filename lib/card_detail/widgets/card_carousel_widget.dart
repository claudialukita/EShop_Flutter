import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_flutter/card_detail/widgets/card_list_item_widget.dart';
import 'package:eshop_flutter/core/providers/cart_address_provider.dart';
import 'package:eshop_flutter/core/providers/cart_init_checkout_provider.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/core/providers/checkout_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardCarouselWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarouselSliderState();
}

class CarouselSliderState extends State {
  int _currentIndex = 0;
  List<int> cardList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                items: cardList.map((item) {
                  return CardListItemWidget(title: item.toString());
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: _currentIndex == index
                          ? Color(0xFF40BFFF)
                          : Color(0xFFEBF0FF),
                    ),
                  );
                }),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(16),
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
            child: Consumer(
              builder: (context, watch, child) {
                // var shoeSummary = watch(summaryModelProvider);
                var cartState = watch(cartProvider);
                var initCheckout = watch(cartInitCheckoutProvider);
                var addressDetail = watch(commitAddressProvider);
                return ElevatedButton(
                  onPressed: () => {
                    context
                        .read(commitCheckoutProvider
                        .notifier)
                        .commitCheckout(initCheckout.data!, addressDetail.data!, cartState.data!.summary.totalPrice),
                    Navigator.pushNamed(context, '/CommitOrderScreen',
                        arguments: cartState.data!.summary.totalPrice > 1000000 ? "Failed" : "Success")
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text('Pay \$${cartState.data!.summary.totalPrice}',
                      style: Theme.of(context).textTheme.button),
                );
              },
            ),
          ),
        ],
      ),

      // ),
    );
  }
}
