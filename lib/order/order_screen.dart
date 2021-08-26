import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/order/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(orderViewModelProvider.notifier).loadData();
    });
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: _heightScreen * (78 / _heightScreen),
        title: Container(
          margin: EdgeInsets.only(
              left: _widthScreen * (52 / _widthScreen),
              top: _heightScreen * (26 / _heightScreen),
              bottom: _heightScreen * (28 / _heightScreen)),
          child: Text(
            "Orders",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
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
            Consumer(builder: (context, watch, widget) {
              final state = watch(orderViewModelProvider);
              print(state);
              if ((state is Loading) || (state is Initial)) {
                return Container(
                    height: 350,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              } else if(state is Error){
                return Container(child: Text("Something went wrong!", style: TextStyle(fontSize: 24, color: Colors.black),),);
              } else {
                return Container(
                  height: _heightScreen * (690 / _heightScreen),
                  width: _widthScreen,
                  margin: EdgeInsets.symmetric(horizontal: _widthScreen * (16/_widthScreen), vertical: _heightScreen * (16/_heightScreen)),
                  child: ListView.builder(
                      itemCount: state.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            width: _widthScreen * (344 / _widthScreen),
                            height: _heightScreen * (185 / _heightScreen),
                            margin:
                            EdgeInsets.only(top: _heightScreen * (16 / _heightScreen)),
                            decoration: BoxDecoration(
                                border: Border.all(color: const Color(0xFFEBF0FF), width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (16 / _heightScreen),
                                      left: _widthScreen * (16 / _widthScreen)),
                                  child: Text(
                                    state.data![index].id,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (12 / _heightScreen),
                                      left: _widthScreen * (16 / _widthScreen)),
                                  child: Text(
                                    "Order at E-shop : " + state.data![index].orderDate,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (24 / _heightScreen),
                                            left: _widthScreen * (16 / _widthScreen)),
                                        child: Text(
                                          "Order Status",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (24 / _heightScreen),
                                            left: _widthScreen * (180 / _widthScreen)),
                                        child: Text(
                                          state.data![index].status,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colors.black
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (12 / _heightScreen),
                                            left: _widthScreen * (16 / _widthScreen)),
                                        child: Text(
                                          "Items",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (12 / _heightScreen),
                                            left: _widthScreen * (162 / _widthScreen)),
                                        child: Text(
                                          state.data![index].numberOfItems +" Items purchased",
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colors.black
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (12 / _heightScreen),
                                            left: _widthScreen * (16 / _widthScreen)),
                                        child: Text(
                                          "Price",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: Colors.grey),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen * (12 / _heightScreen),
                                            left: _widthScreen * (230 / _widthScreen)),
                                        child: Text(
                                          r"$" + state.data![index].totalPrice.toString(),
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: const Color(0xFF40BFFF)
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pushNamed(context, '/OrderDetails', arguments: state.data![index])
                          },
                        );
                      }),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
