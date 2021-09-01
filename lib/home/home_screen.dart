import 'package:eshop_flutter/home/view_model/home_view_model.dart';
import 'package:eshop_flutter/home/widgets/carousel_slider_widget.dart';
import 'package:eshop_flutter/home/widgets/notif_icon_widget.dart';
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
        toolbarHeight: 80,
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Container(
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.zero,
            height: 54,
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
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: const Color(0xFFEBF0FF), width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      BorderSide(color: const Color(0xFFEBF0FF), width: 1.0),
                ),
              ),
              onSubmitted: (String searchStr) async {
                Navigator.pushReplacementNamed(context, '/ProductSearchScreen',
                    arguments: searchStr);
                context
                    .read(shoeGridViewModelProvider.notifier)
                    .loadDataByKeyword(searchStr);
              },
            )),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            width: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 17.75,
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ImageIcon(
                      AssetImage("assets/images/love_icon.png"),
                      color: Color(0xFF9098B1),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  width: 30,
                  height: 30,
                  child: NotifIconWidget(),

                  // FittedBox(
                  //   fit: BoxFit.cover,
                  //   child: ImageIcon(
                  //     AssetImage("assets/images/notif_icon.png"),
                  //     color: Color(0xFF9098B1),
                  //   ),
                  // ),
                ),
              ],
            ),
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
