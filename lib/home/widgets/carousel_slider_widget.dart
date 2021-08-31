import 'package:carousel_slider/carousel_slider.dart';
import 'package:eshop_flutter/home/widgets/item_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarouselSliderHomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CarouselSliderState();
}
class CarouselSliderState extends State{
  int _currentIndex = 0;
  List<int> cardList = [1, 2, 3, 4, 5];

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
      padding: EdgeInsets.all(16),
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
                items: cardList.map((item) {
                  return ItemCardWidget(title: item.toString());
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(cardList, (index, url) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                    // EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
