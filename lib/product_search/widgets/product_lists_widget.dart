import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/shoe.dart';
import 'package:eshop_flutter/core/providers/currency_number_provider.dart';
import 'package:eshop_flutter/home/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var stateSearch = watch(shoeGridViewModelProvider);
    return (stateSearch is Success)
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            // color: Colors.black,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  alignment: Alignment.centerLeft,
                  child: Text("${stateSearch.data!.length} Result",
                      style: Theme.of(context).textTheme.subtitle2),
                ),
                SizedBox(height: 16),
                Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: (MediaQuery.of(context).size.width *
                            (165 / MediaQuery.of(context).size.width)) /
                        (MediaQuery.of(context).size.height *
                            (263 / MediaQuery.of(context).size.height)),
                    children: List.generate(
                      stateSearch.data!.length,
                      (index) {
                        int rate = stateSearch.data![index].rating;
                        return GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(context, '/ProductDetailScreen',
                                arguments: ShoeIdName(
                                    stateSearch.data![index].id,
                                    stateSearch.data![index].name))
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFEBF0FF)),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 155,
                                  width: 155,
                                  // margin: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEBF0FF),
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(stateSearch
                                              .data![index].imageUrls[0]),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  width: 155,
                                  child: Text(stateSearch.data![index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .apply(color: Color(0xFF223263)),
                                      textAlign: TextAlign.start),
                                ),
                                Container(
                                  height: 20,
                                  width: 155,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 20,
                                            color: index >= rate
                                                    // stateSearch.data![index].rating
                                                ? Color(0xFFEBF0FF)
                                                : Color(0xFFFFC833),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  // padding: EdgeInsets.symmetric(vertical: 15),
                                  width: 155,
                                  child: Text(
                                      "\$${currencyNumber.format(stateSearch.data![index].price)}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .apply(color: Color(0xFF40BFFF)),
                                      textAlign: TextAlign.start),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}
