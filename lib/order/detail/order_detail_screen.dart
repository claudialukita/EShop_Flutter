import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/order_model.dart';
import 'package:eshop_flutter/order/detail/order_detail_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;

    OrderList orderList =
        ModalRoute.of(context)!.settings.arguments as OrderList;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context
          .read(orderDetailViewModelProvider.notifier)
          .loadData(orderList.id);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: _heightScreen * (78 / _heightScreen),
        title: Container(
          margin: EdgeInsets.only(
              top: _heightScreen * (26 / _heightScreen),
              bottom: _heightScreen * (28 / _heightScreen)),
          child: Text(
            "Orders Details",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
        ),
        shadowColor: Colors.transparent,
        leading: InkWell(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Consumer(builder: (context, watch, child) {
        final state = watch(orderDetailViewModelProvider);
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
          return Column(
            children: [
              Row(
                children: [
                  //Processed
                  Container(
                      margin: EdgeInsets.only(
                          left: _widthScreen * (28 / _widthScreen),
                          bottom: _heightScreen * (12 / _heightScreen),
                          top: _heightScreen * (16 / _heightScreen)),
                      child: Image.asset(
                        "assets/images/check_warna.png",
                        width: _widthScreen * (30 / _widthScreen),
                        alignment: Alignment.centerRight,
                      )),
                  //Shipping
                  Container(
                    width: _widthScreen * (130 / _widthScreen),
                    alignment: Alignment.centerLeft,
                    child: state.data!.status != "Processed"
                        ? Image.asset("assets/images/Line_warna.png")
                        : Image.asset("assets/images/Line_gelap.png"),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        bottom: _heightScreen * (12 / _heightScreen),
                        top: _heightScreen * (16 / _heightScreen),
                      ),
                      child: state.data!.status != "Processed"
                          ? Image.asset(
                              "assets/images/check_warna.png",
                              width: _widthScreen * (30 / _widthScreen),
                              alignment: Alignment.center,
                            )
                          : Image.asset(
                              "assets/images/check_gelap.png",
                              width: _widthScreen * (30 / _widthScreen),
                              alignment: Alignment.center,
                            )),
                  //Finished
                  Container(
                    width: _widthScreen * (130 / _widthScreen),
                    alignment: Alignment.centerLeft,
                    child: state.data!.status == "Finished"
                        ? Image.asset("assets/images/Line_warna.png")
                        : Image.asset("assets/images/Line_gelap.png"),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          bottom: _heightScreen * (12 / _heightScreen),
                          top: _heightScreen * (16 / _heightScreen)),
                      child: state.data!.status == "Finished"
                          ? Image.asset(
                              "assets/images/check_warna.png",
                              width: _widthScreen * (30 / _widthScreen),
                              alignment: Alignment.centerLeft,
                            )
                          : Image.asset(
                              "assets/images/check_gelap.png",
                              width: _widthScreen * (30 / _widthScreen),
                              alignment: Alignment.centerLeft,
                            )),
                ],
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(
                        left: _widthScreen * (20 / _widthScreen),
                        top: _heightScreen * (5 / _heightScreen)),
                    child: Text(
                      "Processed",
                      style: TextStyle(
                          fontFamily: 'Popping',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: _widthScreen * (105 / _widthScreen),
                        top: _heightScreen * (5 / _heightScreen)),
                    child: Text(
                      "Shipping",
                      style: TextStyle(
                          fontFamily: 'Popping',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        left: _widthScreen * (110 / _widthScreen),
                        top: _heightScreen * (5 / _heightScreen)),
                    child: Text(
                      "Finished",
                      style: TextStyle(
                          fontFamily: 'Popping',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(
                    top: _heightScreen * (24 / _heightScreen),
                    left: _widthScreen * (16 / _widthScreen)),
                child: Text(
                  "Product",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              Container(
                height: _heightScreen * (252 / _heightScreen),
                child: ListView.builder(
                    itemCount: state.data!.shoes.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: _widthScreen * (343 / _widthScreen),
                        height: _heightScreen * (104 / _heightScreen),
                        margin: EdgeInsets.only(
                            top: _heightScreen * (12 / _heightScreen),
                            left: _widthScreen * (16 / _widthScreen),
                            right: _widthScreen * (16 / _widthScreen)),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFEBF0FF), width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Container(
                              width: _widthScreen * (72 / _widthScreen),
                              height: _heightScreen * (72 / _heightScreen),
                              margin: EdgeInsets.only(
                                  left: _widthScreen * (16 / _widthScreen)),
                              child: Image.network(
                                state.data!.shoes[index].imageUrls,
                                width: _widthScreen * (72 / _widthScreen),
                                height: _heightScreen * (72 / _heightScreen),
                              ),
                              // Image.asset("assets/images/shoes.png"),
                            ),
                            Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  alignment: Alignment.centerLeft,
                                  width: _widthScreen * (90/ _widthScreen),
                                  height: _heightScreen * (36 / _heightScreen),
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (16 / _heightScreen),
                                      left: _widthScreen * (12 / _widthScreen)),
                                  child: AutoSizeText(
                                    state.data!.shoes[index].nama,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        color: Colors.black),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  // width: _widthScreen * (52 / _widthScreen),
                                  // alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (12 / _heightScreen),),
                                  child: Text(
                                    r"$" +
                                        state.data!.shoes[index].price
                                            .toStringAsFixed(2),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: const Color(0xFF40BFFF),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              //Shipping section
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: _widthScreen * (16 / _widthScreen),
                    top: _heightScreen * (24 / _heightScreen),
                    bottom: _heightScreen * (12 / _heightScreen)),
                child: Text(
                  "Shipping Detail",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Colors.black),
                ),
              ),
              Container(
                width: _widthScreen * (343 / _widthScreen),
                height: _heightScreen * (179 / _heightScreen),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFEBF0FF), width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen),),
                          child: Text(
                            "Date Shipping",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen * (220/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            state.data!.shipping,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen),),
                          child: Text(
                            "Shipping",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen * (250/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            state.data!.ekspedisi,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen)),
                          child: Text(
                            "No. Resi",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen * (260/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            state.data!.nomorResi,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: _widthScreen * (52/_widthScreen),
                          height: _heightScreen *(22/_heightScreen),
                          margin: EdgeInsets.only(
                              left: _widthScreen * (16 / _widthScreen)),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen * (255 / _widthScreen),
                          height: _heightScreen * (44 / _heightScreen),
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: AutoSizeText(
                            state.data!.address,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              //payment detail section
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    top: _heightScreen * (46 / _heightScreen),
                    left: _widthScreen * (16 / _widthScreen),
                    bottom: _heightScreen * (12 / _heightScreen)),
                child: Text(
                  "Payment Details",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
              Container(
                width: _widthScreen * (343 / _widthScreen),
                height: _heightScreen * (164 / _heightScreen),
                margin: EdgeInsets.only(bottom: _heightScreen * (21/_heightScreen)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: const Color(0xFFEBF0FF), width: 1)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen),
                              ),
                          child: Text(
                            "Items ("+ state.data!.totalItem.toString() +")",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen *(251/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.totalItemPrices.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen),),
                          child: Text(
                            "Shipping",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen *(251/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.shippingPrice.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen)),
                          child: Text(
                            "Tax",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          width: _widthScreen *(283/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.tax.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: _heightScreen * (12 / _heightScreen),
                    ),
                    DottedLine(
                      direction: Axis.horizontal,
                      lineLength: _widthScreen * (311 / _widthScreen),
                      lineThickness: 1.0,
                      dashLength: 4.0,
                      dashColor: const Color(0xFFEBF0FF),
                      dashRadius: 0.0,
                      dashGapLength: 4.0,
                      dashGapColor: Colors.transparent,
                      dashGapRadius: 0.0,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen)),
                          child: Text(
                            "Total Price",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.black),
                          ),
                        ),
                        Container(
                          width: _widthScreen *(240/_widthScreen),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.totalPrice.toStringAsFixed(2),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: const Color(0xFF40BFFF)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: state.data!.status == "Shipping",
                  child: Container(
                    width: _widthScreen * (343 / _widthScreen),
                    height: _heightScreen * (57 / _heightScreen),
                    margin: EdgeInsets.only(
                        left: _widthScreen * (16 / _widthScreen),
                        right: _widthScreen * (16 / _widthScreen),
                        bottom: _heightScreen * (50 / _heightScreen)),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF40BFFF).withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFF40BFFF),
                        shadowColor: const Color(0xFF40BFFF),
                      ),
                      onPressed: () {
                      context
                          .read(orderDetailViewModelProvider.notifier).finishOrder(state.data!.id);
                      final finish = watch(orderDetailViewModelProvider);
                      },
                      child: Text(
                        "Finish Order",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
              ),
            ],
          );
        }
      })),
    );
  }
}
