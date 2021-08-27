import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotFoundWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF40BFFF),
              borderRadius: BorderRadius.circular(56),
              border: Border.all(color: Color(0xFFEBF0FF)),
            ),
            child: Icon(
              Icons.close_rounded,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),
          Container(
            alignment: Alignment.center,
            child: Text("Product Not Found",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .apply(color: Color(0xFF223263))),
          ),
          SizedBox(height: 8),
          Container(
            alignment: Alignment.center,
            child: Text("thank you for shopping using lafyuu",
                style: Theme.of(context)
                    .textTheme
                    .caption),
          ),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF40BFFF).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(1, 3), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: () => {
                Navigator.pushReplacementNamed(context, '/MainTabScreen')
              },
              style: Theme.of(context)
                  .elevatedButtonTheme
                  .style,
              child: Text('Back To Home',
                  style:
                  Theme.of(context).textTheme.button),
            ),
          ),
        ],
      ),
    );
  }
}
