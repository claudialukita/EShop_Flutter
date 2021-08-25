import 'package:eshop_flutter/product_detail/widgets/carousel_slider_widget.dart';
import 'package:eshop_flutter/product_detail/widgets/product_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    var shoeId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF9098B1),
          ),
        ),
        title: RichText(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline5,
              text: "Nike Air Max 270 React ENG Nike Air Max 270 React ENG"),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child:Icon(Icons.search, color: Color(0xFF9098B1)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.more_vert, color: Color(0xFF9098B1)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSliderDetailWidget(),
            ProductDetailWidget(shoeId: shoeId),
          ],
        ),
      ),
    );
  }
}
