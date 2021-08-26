import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/profile/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read(profileViewModelProvider.notifier).loadData();
    });

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: _height * (78 / _height),
          title: Container(
              margin: EdgeInsets.only(
                  top: _height * (26 / _height),
                  bottom: _height * (28 / _height)),
              child: Text(
                "Profile",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Consumer(builder: (context, watch, child) {
            final state = watch(profileViewModelProvider);
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
                          width: _width * (72 / _width),
                          height: _height * (72 / _height),
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.red),
                          margin: EdgeInsets.only(
                              left: _width * (16 / _width),
                              top: _height * (24 / _height)),
                          child: ClipOval(
                              child: Image.network(
                            state.data!.photoUrl,
                            width: _width * (72 / _width),
                            height: _height * (72 / _height),
                            fit: BoxFit.fill,
                          ))
                          // Image.asset("assets/images/Profile_Picture.png"),
                          ),
                      Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 16, top: 20),
                            child: Text(
                              state.data!.name,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, left: 16),
                            child: Text(
                              state.data!.instagramUrl,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100, top: 20),
                        child: Image.asset("assets/images/coin.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 5),
                        child: Text(
                          state.data!.point.floor().toString(),
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  // gender section
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 49, left: 16),
                          child: Icon(
                            Icons.female,
                            color: const Color(0xFF40BFFF),
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 49, left: 10),
                          child: Text(
                            "Gender",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                            color: Colors.black),
                          ),
                        ),
                        Container(
                          width: _width * (235/_width),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 49),
                          child: Text(
                            state.data!.gender,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 49, left: 25),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF9098B1),
                            )),
                      ],
                    ),
                  ),
                  //birthday section
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 16),
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: const Color(0xFF40BFFF),
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 10),
                          child: Text(
                            "Birthday",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                            color: Colors.black),
                          ),
                        ),
                        Container(
                          width: _width * (230/_width),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            state.data!.birthday,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 25),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF9098B1),
                            )),
                      ],
                    ),
                  ),
                  //email section
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 16),
                          child: Icon(
                            Icons.email_outlined,
                            color: const Color(0xFF40BFFF),
                            size: 30,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 25, left: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                            color: Colors.black), textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                          width: _width * (250/_width),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            state.data!.email,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 25),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF9098B1),
                            )),
                      ],
                    ),
                  ),
                  // phone number section
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 16),
                          child: Icon(
                            Icons.phone_android_sharp,
                            color: const Color(0xFF40BFFF),
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 10),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                            color: Colors.black),
                          ),
                        ),
                        Container(
                          width: _width * (195/_width),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            state.data!.phone,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 25),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF9098B1),
                            )),
                      ],
                    ),
                  ),
                  //change password section
                  Container(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 16),
                          child: Icon(
                            Icons.lock_outlined,
                            color: const Color(0xFF40BFFF),
                            size: 30,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25, left: 10),
                          child: Text(
                            "Change Password",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                            color: Colors.black),
                          ),
                        ),
                        Container(
                          width: _width * (175/_width),
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(top: 25),
                          child: Text(
                            "•••••••••••••••••",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 25),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: const Color(0xFF9098B1),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 57,
                    margin: EdgeInsets.only(
                        left: 16, right: 16, top: 53, bottom: 20),
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
                        "Logout",
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
          }),
        ));
  }
}
