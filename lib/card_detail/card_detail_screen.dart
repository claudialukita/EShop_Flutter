import 'package:eshop_flutter/card_detail/widgets/card_carousel_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF9098B1),
          ),
        ),
        title: Container(
          // margin: EdgeInsets.all(20),
          // height: 45,
          child: Text(
            "Choose Card",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .apply(color: Color(0xFF223263)),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            child:Icon(Icons.add, size: 30, color: Color(0xFF40BFFF)),
          ),
        ],
      ),
      body: CardCarouselWidget(),
    );
  }

}