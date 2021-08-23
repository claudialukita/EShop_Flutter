import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 78,
        title: Container(
            margin: EdgeInsets.only(left: 42, top: 30, bottom: 28),
            child : Text("Profile", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),)),
        backgroundColor: Colors.white,
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
            // SizedBox(height: 24,),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04, top: 24),
                  child: Image.asset("assets/images/Profile_Picture.png"),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 16, top: 20),
                      child:
                      Text("Dominic Ovo", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 14),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 16),
                      child: Text("@dominic_ovo", style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey),),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 100, top: 20),
                  child: Image.asset("assets/images/coin.png"),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 5),
                  child: Text("200", style: TextStyle(fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.w600),),
                ),
              ],
            ),
            // gender section
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 49, left: 16),
                    child: Icon(Icons.female, color: const Color(0xFF40BFFF), size: 30,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 49, left: 10),
                    child: Text("Gender", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 49, left: 200),
                    child: Text("Male", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 49, left: 25),
                    child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF9098B1),)
                  ),
                ],
              ),
            ),
            //birthday section
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 16),
                    child: Icon(Icons.calendar_today_outlined, color: const Color(0xFF40BFFF), size: 30,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 10),
                    child: Text("Birthday", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 156),
                    child: Text("12-12-2000", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25, left: 25),
                      child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF9098B1),)
                  ),
                ],
              ),
            ),
            //email section
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 16),
                    child: Icon(Icons.email_outlined, color: const Color(0xFF40BFFF), size: 30,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 10),
                    child: Text("Email", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 110),
                    child: Text("rex4dom@gmail.com", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25, left: 25),
                      child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF9098B1),)
                  ),
                ],
              ),
            ),
            // phone number section
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 16),
                    child: Icon(Icons.phone_android_sharp, color: const Color(0xFF40BFFF), size: 30,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 10),
                    child: Text("Phone Number", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 93),
                    child: Text("(307) 555-0133", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25, left: 25),
                      child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF9098B1),)
                  ),
                ],
              ),
            ),
            //change password section
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 16),
                    child: Icon(Icons.lock_outlined, color: const Color(0xFF40BFFF), size: 30,),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 10),
                    child: Text("Change Password", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 78),
                    child: Text("•••••••••••••••••", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 25, left: 25),
                      child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF9098B1),)
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 57,
              margin: EdgeInsets.only(left: 16, right: 16, top: 53, bottom: 20),
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
                child: Text("Logout", style: TextStyle(fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),),
            ),
          ],
        )
        ),
      );
  }

}