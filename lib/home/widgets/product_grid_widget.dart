import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductGridWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.4,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: (MediaQuery.of(context).size.width *
                (165 / MediaQuery.of(context).size.width)) /
            (MediaQuery.of(context).size.height *
                (263 / MediaQuery.of(context).size.height)),
        children: List.generate(
          4,
          (index) {
            return GestureDetector(
              onTap: () => {
                Navigator.pushNamed(
                    context, '/ProductDetailScreen'/*, arguments: state.data![index].id*/)
              },
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEBF0FF)),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 155,
                      width: 155,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFEBF0FF),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      width: 155,
                      child: Text("Nike Air Max 270 React ENG",
                          style: Theme.of(context).textTheme.headline3!.apply(color: Color(0xFF223263)),
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
                                color: index == 4
                                    ? Color(0xFFEBF0FF)
                                    : Color(0xFFFFC833),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: 155,
                      child: Text("\$299,43",
                          style: Theme.of(context).textTheme.headline3!.apply(color: Color(0xFF40BFFF)),
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
