
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: _heightScreen * (78 / _heightScreen),
        title: Container(
          margin: EdgeInsets.only(left: _widthScreen * (52/_widthScreen), top: _heightScreen * (26/_heightScreen), bottom: _heightScreen * (28/_heightScreen)),
          child: Text("Orders", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
        ),
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              height: 10,
              thickness: 1,
              indent: 0,
              color: const Color(0xFFEBF0FF),
            ),
            Container(
              width: _widthScreen * (344 / _widthScreen),
              height: _heightScreen * (201 / _heightScreen),
              margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen)),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFEBF0FF),width: 1),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen)),
                    child: Text("LQNSU346JK",style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins', fontSize: 14),),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen), left: _widthScreen * (16/_widthScreen)),
                    child: Text("Order at E-shop : August 1, 2017", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: _heightScreen * (24/_heightScreen), left: _widthScreen * (16/_widthScreen)),
                          child: Text("Order Status", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey),),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: _heightScreen * (24/_heightScreen), left: _widthScreen * (180/_widthScreen)),
                          child: Text("Shipping", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12,),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen), left: _widthScreen * (16/_widthScreen)),
                          child: Text("Items", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey),),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen), left: _widthScreen * (162/_widthScreen)),
                          child: Text("2 Items purchased", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12,),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen), left: _widthScreen * (16/_widthScreen)),
                          child: Text("Price", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey),),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen), left: _widthScreen * (230/_widthScreen)),
                          child: Text(r"$299,43", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12,),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

}