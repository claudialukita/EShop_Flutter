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
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.cover),
      )
    );
  }
}