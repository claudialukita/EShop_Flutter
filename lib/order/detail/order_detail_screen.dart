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
                  Container(
                      child: Column(
                    children: [
                      Container(
                          // width: _widthScreen * (72/_widthScreen),
                          // height: _heightScreen * (72/_heightScreen),
                          margin: EdgeInsets.only(
                              left: _widthScreen * (28 / _widthScreen),
                              bottom: _heightScreen * (12 / _heightScreen),
                              top: _heightScreen * (16 / _heightScreen)),
                          child: Image.asset("assets/images/check_warna.png")
                          // state.data!.shoes.length > 4 ?
                          // Image.asset("assets/images/coin.png") : Image.asset("assets/images/facebook.png"),
                          ),
                      Container(
                        margin: EdgeInsets.only(
                            left: _widthScreen * (20 / _widthScreen),
                            top: _heightScreen * (12 / _heightScreen)),
                        child: Text(
                          "Processed",
                          style: TextStyle(
                              fontFamily: 'Popping',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  )),
                  Divider(
                    height: 10,
                    thickness: 1,
                    indent: 0,
                    color: Colors.black,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          width: _widthScreen * (100 / _widthScreen),
                          alignment: Alignment.centerLeft,
                          child: Image.asset("assets/images/Line_warna.png"),
                        ),
                        Container(
                          child: Text(
                            "Shipping",
                            style: TextStyle(
                                fontFamily: 'Popping',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                          ),
                        )
                      ],
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
                                state.data!.shoes[index].imageUrls[0],
                                width: _widthScreen * (72 / _widthScreen),
                                height: _heightScreen * (72 / _heightScreen),
                              ),
                              // Image.asset("assets/images/shoes.png"),
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  width: _widthScreen * (158 / _widthScreen),
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
                                // SizedBox(height: 10,),
                                Container(
                                  width: _widthScreen * (52 / _widthScreen),
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(
                                      top: _heightScreen * (18 / _heightScreen),
                                      left: _widthScreen * (12 / _widthScreen)),
                                  child: Text(
                                    r"$" +
                                        state.data!.shoes[index].price
                                            .toString(),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (120 / _widthScreen)),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (176 / _widthScreen)),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (176 / _widthScreen)),
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
                          margin: EdgeInsets.only(
                              top: _heightScreen * (16 / _heightScreen),
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (83 / _widthScreen)),
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
                          width: _widthScreen * (176 / _widthScreen),
                          height: _heightScreen * (44 / _heightScreen),
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
                              right: _widthScreen * (200 / _widthScreen)),
                          child: Text(
                            "Items (3)",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.totalItemPrices.toString(),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (210 / _widthScreen)),
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
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.shippingPrice.toString(),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (241 / _widthScreen)),
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
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$" + state.data!.tax.toString(),
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
                              left: _widthScreen * (16 / _widthScreen),
                              right: _widthScreen * (188 / _widthScreen)),
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
                          margin: EdgeInsets.only(
                            top: _heightScreen * (16 / _heightScreen),
                          ),
                          child: Text(
                            r"$766.86",
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
              Container(
                width: _widthScreen * (343 / _widthScreen),
                height: _heightScreen * (57 / _heightScreen),
                margin: EdgeInsets.only(
                    left: _widthScreen * (16 / _widthScreen),
                    right: _widthScreen * (16 / _widthScreen),
                    top: _heightScreen * (21 / _heightScreen),
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
                  onPressed: () => {},
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
            ],
          );
        }
      })),
    );
  }
}
