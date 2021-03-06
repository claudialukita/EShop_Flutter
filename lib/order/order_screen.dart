import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/order/order_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(orderViewModelProvider.notifier).loadData();
    });
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
    final numberFormat = NumberFormat.decimalPattern();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 78,
        elevation: 0.5,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: Container(
          margin: EdgeInsets.all(20),
          // height: 45,
          child: Text(
            "Orders",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .apply(color: Color(0xFF223263)),
          ),
        ),
      ),
      // AppBar(
      //   backgroundColor: Colors.white,
      //   // toolbarHeight: _heightScreen * (78 / _heightScreen),
      //   title: Container(
      //     width: _widthScreen * (59/_widthScreen),
      //     alignment: Alignment.centerLeft,
      //     margin: EdgeInsets.only(
      //         left: _widthScreen * (30 / _widthScreen),
      //         top: _heightScreen * (26 / _heightScreen),
      //         bottom: _heightScreen * (20 / _heightScreen)),
      //     child: Text(
      //       "Orders",
      //       style: TextStyle(
      //           fontFamily: 'Poppins',
      //           fontSize: 16,
      //           fontWeight: FontWeight.w700,
      //           color: const Color(0xFF223263),
      //       ),textAlign: TextAlign.left,
      //     ),
      //   ),
      //   shadowColor: Colors.transparent,
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer(builder: (context, watch, widget) {
              final state = watch(orderViewModelProvider);
              print(state);
              if ((state is Loading) || (state is Initial)) {
                return Container(
                    height: 350,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              } else if (state is Error) {
                return Container(
                  child: Text(
                    "Something went wrong!",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                );
              } else {
                return Container(
                  height: _heightScreen * (690 / _heightScreen),
                  width: _widthScreen,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                      itemCount: state.data!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Container(
                            width: _widthScreen * (344 / _widthScreen),
                            height: _heightScreen * (185 / _heightScreen),
                            margin: EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFFEBF0FF), width: 2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(top: 16, left: 16),
                                  child: Text(
                                    state.data![index].id,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: const Color(0xFF223263)),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (12 / _heightScreen),
                                      left: _widthScreen * (16 / _widthScreen)),
                                  child: Text(
                                    "Order at E-shop : " +
                                        state.data![index].orderDate,
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
                                            top: _heightScreen *
                                                (24 / _heightScreen),
                                            left: _widthScreen *
                                                (16 / _widthScreen)),
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
                                        width:
                                        _widthScreen * (260 / _widthScreen),
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen *
                                                (24 / _heightScreen),
                                            right: _widthScreen *
                                                (16.5 / _widthScreen)),
                                        child: Text(
                                          state.data![index].status,
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: const Color(0xFF223263)),
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
                                            top: _heightScreen *
                                                (12 / _heightScreen),
                                            left: _widthScreen *
                                                (16 / _widthScreen)),
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
                                        width:
                                        _widthScreen * (300 / _widthScreen),
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen *
                                                (12 / _heightScreen),
                                            right: _widthScreen *
                                                (16.5 / _widthScreen)),
                                        child: Text(
                                          state.data![index].numberOfItems +
                                              " Items purchased",
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: const Color(0xFF223263)),
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
                                            top: _heightScreen *
                                                (12 / _heightScreen),
                                            left: _widthScreen *
                                                (16 / _widthScreen)),
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
                                        width:
                                        _widthScreen * (305 / _widthScreen),
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.only(
                                            top: _heightScreen *
                                                (12 / _heightScreen),
                                            right: _widthScreen *
                                                (16.5 / _widthScreen)),
                                        child: Text(
                                          r"$" +
                                              numberFormat.format(state
                                                  .data![index].totalPrice),
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                              color: const Color(0xFF40BFFF)),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () => {
                            Navigator.pushNamed(context, '/OrderDetails',
                                arguments: state.data![index])
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