import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemCardDetailWidget extends StatelessWidget {
  final String imgUrl;

  const ItemCardDetailWidget({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        // color: Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      )
      // ,
      // child: Container(
      //   padding: EdgeInsets.symmetric(horizontal: 30),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Container(
      //         width: MediaQuery.of(context).size.width * 0.7,
      //         child: Text("Recommend Product", style: Theme.of(context).textTheme.headline1),
      //       ),
      //       SizedBox(height: 16),
      //       Container(
      //         width: MediaQuery.of(context).size.width * 0.7,
      //         child: Text("We recommend the best for you.", style: Theme.of(context).textTheme.bodyText2),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}