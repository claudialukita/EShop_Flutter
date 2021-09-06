import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/providers/alert_dialog.dart';
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
          toolbarHeight: 78,
          elevation: 0.5,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          automaticallyImplyLeading: false,
          title: Container(
            margin: EdgeInsets.all(20),
            // height: 45,
            child: Text(
              "Profile",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .apply(color: Color(0xFF223263)),
            ),
          ),
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
              var cek = state as Error;
              return AlertDialogs(cek.error);
            } else {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 72,
                    child: Row(
                      children: [
                        Container(
                            width: _width * (72 / _width),
                            height: _height * (72 / _height),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red),
                            // margin: EdgeInsets.only(
                            //     left: _width * (16 / _width),
                            //     top: _height * (24 / _height)),
                            child: ClipOval(
                                child: Image.network(
                              state.data!.photoUrl,
                              width: _width * (72 / _width),
                              height: _height * (72 / _height),
                              fit: BoxFit.fill,
                            ))
                            // Image.asset("assets/images/Profile_Picture.png"),
                            ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: _width * (120 / _width),
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        state.data!.name,
                                        style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            color: Color(0xFF223263)),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
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
                              ),
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(left: 100, top: 20),
                                    child:
                                        Image.asset("assets/images/coin.png"),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.only(top: 20, left: 5),
                                    child: Text(
                                      state.data!.point.floor().toString(),
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // gender section
                  Container(
                    margin: EdgeInsets.only(
                        left: 16, right: 16, top: 32, bottom: 16),
                    child: Column(
                      children: [
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 49),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/gender_icon.png"),
                                          color: Color(0xFF40BFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Container(
                                  width: _width * (235 / _width),
                                  alignment: Alignment.centerRight,
                                  // margin: EdgeInsets.only(top: 49),
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color(0xFF9098B1),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 49),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/calendar_icon.png"),
                                          color: Color(0xFF40BFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Birthday",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Container(
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color(0xFF9098B1),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 49),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/mail_icon.png"),
                                          color: Color(0xFF40BFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Email",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Container(
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color(0xFF9098B1),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 49),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/phone_icon.png"),
                                          color: Color(0xFF40BFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Container(
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color(0xFF9098B1),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          height: 45,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // margin: EdgeInsets.only(top: 49),
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      width: 20,
                                      height: 20,
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        child: ImageIcon(
                                          AssetImage(
                                              "assets/images/lock_icon.png"),
                                          color: Color(0xFF40BFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 16),
                                    child: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF223263)),
                                    ),
                                  ),
                                ],
                              ),
                              Row(children: [
                                Container(
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: const Color(0xFF9098B1),
                                    )),
                              ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 57,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF40BFFF).withOpacity(0.5),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: Offset(0, 7), // changes position of shadow
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
                            .read(profileViewModelProvider.notifier)
                            .logOut();
                        Navigator.pushNamed(context, "/login");
                      },
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
