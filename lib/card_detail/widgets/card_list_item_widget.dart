import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardListItemWidget extends StatelessWidget {
  final String title;

  const CardListItemWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xFF40BFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: Icon(
                      Icons.circle,
                      size: 32,
                      color: Color(0xFF223263).withOpacity(0.3),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 18),
                    child: Icon(
                      Icons.circle,
                      size: 32,
                      color: Color(0xFF223263).withOpacity(0.3),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 31),
              Container(
                child: Text("6326 9124 8124 9875",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        wordSpacing: 25)),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        child: Text("CAR HOLDER",
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Container(
                        child: Text("Dominic Ovo",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .apply(color: Colors.white)),
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Container(
                        child: Text("CAR SAVE",
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Container(
                        child: Text("19/2024",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .apply(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
