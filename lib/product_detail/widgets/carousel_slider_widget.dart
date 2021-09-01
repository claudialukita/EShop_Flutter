import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_flutter/product_detail/widgets/item_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselSliderDetailWidget extends StatefulWidget {
  List<String> imgUrls;
  CarouselSliderDetailWidget(this.imgUrls);
  @override
  State<StatefulWidget> createState() => CarouselSliderState(imgUrls);
}
class CarouselSliderState extends State{
  List<String> imgUrls;
  CarouselSliderState(this.imgUrls);

  int _currentIndex = 0;
  // List<String> cardList = imgUrls;

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    enlargeCenterPage: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    }),
                items: imgUrls.map((item) {
                  return ItemCardDetailWidget(imgUrl: item);
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(imgUrls, (index, url) {
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
      ),
    );
  }
}
