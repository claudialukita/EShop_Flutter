import 'package:eshop_flutter/product_search/widgets/product_lists_widget.dart';
import 'package:eshop_flutter/product_search/widgets/product_not_found_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSearchScreen extends ConsumerWidget{
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var searchStr = ModalRoute.of(context)!.settings.arguments as String;
    var txt = TextEditingController();
    txt.text = searchStr;
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
            margin: EdgeInsets.only(top: 5, right: 10),
            height: 45,
            child: TextField(
              controller: searchStr == "ada" ? txt : null,
              autofocus: false,
              style: Theme.of(context).textTheme.subtitle2,
              decoration:InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintStyle: Theme.of(context).textTheme.caption,
                hintText: "Search Product",
                prefixIcon: Icon(Icons.search, color: Color(0xFF40BFFF),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onSubmitted: (String searchStr) async {
                Navigator.pushReplacementNamed(
                    context, '/ProductSearchScreen', arguments: searchStr);
              },
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            searchStr == 'ada' ?
            ProductListWidget() :
            ProductNotFoundWidget(),
          ],
        ),
      ),
    );
  }

}