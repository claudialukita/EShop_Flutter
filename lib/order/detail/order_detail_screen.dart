import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final double _heightScreen = MediaQuery.of(context).size.height;
    final double _widthScreen = MediaQuery.of(context).size.width;
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       toolbarHeight: _heightScreen * (78 / _heightScreen),
       title: Container(
         margin: EdgeInsets.only(top: _heightScreen * (26/_heightScreen), bottom: _heightScreen * (28/_heightScreen)),
         child: Text("Orders Details", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
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
       child: Column(
         children: [
           Container(
             alignment: Alignment.topLeft,
             margin: EdgeInsets.only(top: _heightScreen * (98/_heightScreen), left: _widthScreen * (16/_widthScreen)),
             child: Text("Product", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700),),
           ),
           Container(
             width: _widthScreen * (343 / _widthScreen),
             height: _heightScreen * (104/_heightScreen),
             margin: EdgeInsets.only(top: _heightScreen * (12/_heightScreen)),
             decoration: BoxDecoration(
               border: Border.all(
                 color: const Color(0xFFEBF0FF),width: 1
               ),
               borderRadius: BorderRadius.circular(10)
             ),
             child: Row(
               children: [
                 Container(
                   width: _widthScreen * (72 / _widthScreen),
                   height: _heightScreen * (72/_heightScreen),
                   margin: EdgeInsets.only(left: _widthScreen * (16/_widthScreen)),
                   child: Image.asset("assets/images/shoes.png"),
                 ),
                 Column(
                   children: [
                     Container(
                       alignment: Alignment.centerLeft,
                       width: _widthScreen * (158/_widthScreen),
                       height: _heightScreen * (36/_heightScreen),
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (12/_widthScreen)),
                       child: AutoSizeText("Nike Air Zoom Pegasus 36 Miami",maxLines: 2, style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 12),),
                     ),
                     // SizedBox(height: 10,),
                     Container(
                       width: _widthScreen * (52/_widthScreen),
                       alignment: Alignment.centerLeft,
                       margin: EdgeInsets.only(top: _heightScreen * (18/_heightScreen), left: _widthScreen * (12/_widthScreen)),
                       child: Text(r"$299,43", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF40BFFF),), textAlign: TextAlign.left,),
                     )
                   ],
                 ),
               ],
             ),
           ),
           Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.only(left: _widthScreen *(16 / _widthScreen), top: _heightScreen * (24/_heightScreen), bottom: _heightScreen * (12/_heightScreen)),
             child: Text("Shipping Detail", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: 'Poppins'),),
           ),
           Container(
             width: _widthScreen * (343/_widthScreen),
             height: _heightScreen * (179/_heightScreen),
             decoration: BoxDecoration(
               border: Border.all(color: const Color(0xFFEBF0FF),width: 1
               ),
               borderRadius: BorderRadius.circular(10)
             ),
             child: Column(
               children: [
                 Row(
                     children: [
                       Container(
                         margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (120/_widthScreen)),
                         child: Text("Date Shipping", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                       ),
                       Container(
                         margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                         child: Text("January 16, 2020", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                       )
                     ],
                   ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (176/_widthScreen)),
                       child: Text("Shipping", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text("POS Regular", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                     )
                   ],
                 ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (176/_widthScreen)),
                       child: Text("No. Resi", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text("000192848573", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                     )
                   ],
                 ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (83/_widthScreen)),
                       child: Text("Address", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       width: _widthScreen * (176/_widthScreen),
                       height: _heightScreen * (44/_heightScreen),
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: AutoSizeText("2727 New  Owerri, Owerri, Imo State 78410", maxLines: 2,style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'), textAlign: TextAlign.right,),
                     )
                   ],
                 ),
               ],
             ),
           ),
           //payment detail section
           Container(
             alignment: Alignment.centerLeft,
             margin: EdgeInsets.only(top: _heightScreen * (46/_heightScreen), left: _widthScreen*(16/_widthScreen), bottom: _heightScreen *(12/_heightScreen)),
             child: Text("Payment Details", style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Poppins', fontSize: 14),),
           ),
           Container(
             width: _widthScreen * (343/_widthScreen),
             height: _heightScreen * (164/_heightScreen),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               border: Border.all(color: const Color(0xFFEBF0FF),width: 1)
             ),
             child: Column(
               children: [
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (200/_widthScreen)),
                       child: Text("Items (3)", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text(r"$598.86", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                     )
                   ],
                 ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (210/_widthScreen)),
                       child: Text("Shipping", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text(r"$40.00", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                     )
                   ],
                 ),
                 Row(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (241/_widthScreen)),
                       child: Text("Tax", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins', color: Colors.grey),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text(r"$128.00", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Poppins'),),
                     )
                   ],
                 ),
                 SizedBox(height: _heightScreen * (12/_heightScreen),),
                 DottedLine(
                   direction: Axis.horizontal,
                   lineLength: _widthScreen * (311/_widthScreen),
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
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen), left: _widthScreen * (16/_widthScreen), right: _widthScreen * (188/_widthScreen)),
                       child: Text("Total Price", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, fontFamily: 'Poppins',),),
                     ),
                     Container(
                       margin: EdgeInsets.only(top: _heightScreen * (16/_heightScreen),),
                       child: Text(r"$766.86", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, fontFamily: 'Poppins', color: const Color(0xFF40BFFF)),),
                     )
                   ],
                 ),
               ],
             ),
           ),
           Container(
             width: _widthScreen * (343/_widthScreen),
             height: _heightScreen * (57/_heightScreen),
             margin: EdgeInsets.only(left: _widthScreen * (16/_widthScreen), right: _widthScreen * (16/_widthScreen), top: _heightScreen * (21/_heightScreen), bottom: _heightScreen * (50/_heightScreen)),
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
               child: Text("Finish Order", style: TextStyle(fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),),
           ),
         ],
       ),
     ),
   );
  }

}