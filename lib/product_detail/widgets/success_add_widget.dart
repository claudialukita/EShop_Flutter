import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuccessAddWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
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
              text: "Nike Air Max 270 React ENG Nike Air Max 270 React ENG"),
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
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                Icons.check_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
            SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              child: Text("Added To Cart",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .apply(color: Color(0xFF223263))),
            ),
            SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
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
      )
    );
  }
}
