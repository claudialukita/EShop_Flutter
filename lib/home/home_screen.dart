import 'package:eshop_flutter/home/view_model/home_view_model.dart';
import 'package:eshop_flutter/home/widgets/carousel_slider_widget.dart';
import 'package:eshop_flutter/home/widgets/product_grid_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State {
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(shoeGridViewModelProvider.notifier).loadAllData();
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
            padding: EdgeInsets.only(top: 5),
            height: 45,
            child: TextField(
              controller: null,
              autofocus: false,
              style: Theme.of(context).textTheme.subtitle2,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintStyle: Theme.of(context).textTheme.caption,
                hintText: "Search Product",
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0xFF40BFFF),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onSubmitted: (String searchStr) async {
                Navigator.pushNamed(
                    context, '/ProductSearchScreen', arguments: searchStr);
              },
            )),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.favorite_border, color: Color(0xFF9098B1)),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Icon(Icons.notifications_none, color: Color(0xFF9098B1)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSliderHomeWidget(),
            ProductGridWidget(),
          ],
        ),
      ),
    );
  }
}
