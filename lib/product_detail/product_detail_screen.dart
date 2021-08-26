import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/product_detail/view_model/color_state_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/product_detail_view_model.dart';
import 'package:eshop_flutter/product_detail/view_model/size_state_view_model.dart';
import 'package:eshop_flutter/product_detail/widgets/carousel_slider_widget.dart';
import 'package:eshop_flutter/product_detail/widgets/product_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    ShoeIdName arg = ModalRoute.of(context)!.settings.arguments as ShoeIdName;
    var shoeId = arg.shoeId;
    var shoeName = arg.shoeName;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(productDetailViewModelProvider.notifier).loadData(shoeId);
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(colorViewModelProvider.notifier).selectColor(-1);
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await context.read(sizeViewModelProvider.notifier).selectSize(-1);
    });


    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
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
              text: shoeName),
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
            Consumer(builder: (context, watch, child) {
              final _shoeDetail = watch(productDetailViewModelProvider);
              List<String> imgUrls = _shoeDetail.data!.imageUrls;
              return (_shoeDetail is Success) ? CarouselSliderDetailWidget(imgUrls)
              : CircularProgressIndicator();
            }),
            ProductDetailWidget(/*shoeId: shoeId*/),
          ],
        ),
      ),
    );
  }
}
