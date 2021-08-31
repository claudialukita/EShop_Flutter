import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/profile/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardListItemWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, watch) {
    var profileDetail = watch(profileViewModelProvider);
    return (profileDetail is Success) ? Container(
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
                        child: Text("CARD HOLDER",
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      Container(
                        child: Text(profileDetail.data!.name,
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
                        child: Text("CARD SAVE",
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
    ) : CircularProgressIndicator();
  }
}
