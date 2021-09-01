import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_flutter/card_detail/widgets/card_list_item_widget.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/providers/cart_address_provider.dart';
import 'package:eshop_flutter/core/providers/cart_init_checkout_provider.dart';
import 'package:eshop_flutter/core/providers/cart_provider.dart';
import 'package:eshop_flutter/core/providers/checkout_provider.dart';
import 'package:eshop_flutter/core/providers/currency_number_provider.dart';
import 'package:eshop_flutter/profile/profile_view_model.dart';
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
      height: MediaQuery.of(context).size.height * 1,
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
                  return CardListItemWidget();
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    EdgeInsets.only(top: 25, left: 4, right: 4),
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
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF40BFFF).withOpacity(0.5),
                  spreadRadius: 7,
                  blurRadius: 10,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: Consumer(
              builder: (context, watch, child) {
                // var shoeSummary = watch(summaryModelProvider);
                var cartState = watch(cartProvider);
                var initCheckout = watch(cartInitCheckoutProvider);
                var addressDetail = watch(commitAddressProvider);
                final stateProfile = watch(profileViewModelProvider);
                final statePay = watch(commitCheckoutProvider);

                return (cartState is Success) ? ElevatedButton(
                  onPressed: () => {
                    context
                        .read(commitCheckoutProvider.notifier)
                        .commitCheckout(
                            initCheckout.data!,
                            addressDetail.data!,
                            cartState.data!.summary.totalPrice,
                            stateProfile.data!.limit),
                    (statePay is Success) && cartState.data!.summary.totalPrice <=
                        stateProfile.data!.limit
                        ? context.read(cartProvider.notifier).resetShoeCart() : {},
                    (statePay is Success) ? Navigator.pushNamed(context, '/CommitOrderScreen',
                        arguments:
                        "Success") : CircularProgressIndicator(),
                    (statePay is ResponseError) ? Navigator.pushNamed(context, '/CommitOrderScreen',
                        arguments: "Failed") : CircularProgressIndicator(),
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: Text(
                      'Pay \$${currencyNumber.format(cartState.data!.summary.totalPrice)}',
                      style: Theme.of(context).textTheme.button),
                ) : CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),

      // ),
    );
  }
}
