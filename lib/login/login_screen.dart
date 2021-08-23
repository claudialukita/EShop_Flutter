import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 110),
                    child: Image.asset('assets/images/Icon_Login.png'),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("Welcome to E-shop", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 16),),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("Sign in to continue", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 12, color: Colors.grey), ),
                  ),
                  Container(
                    height: 48,
                    margin: EdgeInsets.only(left: 16, right: 16, top: 28, bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon : Icon(
                              Icons.email_outlined
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFFEBF0FF), width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFFEBF0FF), width: 1.0),
                          ),
                          hintText: 'Your Email'
                      ),
                    ),
                  ),
                  Container(
                    height: 48,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          prefixIcon : Icon(
                              Icons.lock_outline
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFFEBF0FF), width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color(0xFFEBF0FF), width: 1.0),
                          ),
                          hintText: 'Password'
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 57,
                    margin: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
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
                      child: Text("Sign In", style: TextStyle(fontFamily: "Poppins", fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),),),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                              indent: 20,
                            ),
                          )
                      ),
                      Text("OR",style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey),),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Divider(
                              height: 10,
                              thickness: 1,
                              indent: 20,
                            ),
                          )
                      ),
                    ],
                  ),
                  Container(
                    height: 57,
                    margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEBF0FF))
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Image.asset("assets/images/google.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Text("Login with Google", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey,),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 57,
                    margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFEBF0FF))
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: Image.asset("assets/images/facebook.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 100),
                          child: Text("Login with facebook", style: TextStyle(fontFamily: 'Poppins', fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey,),),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 16),
                      child: Text("Forgot Password?", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF40BFFF)),),
                    ),
                  ),
                  Center(
                    child:
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, left: MediaQuery.of(context).size.width * 0.25),
                              child: Text(" Don’t have a account?", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(" Register", style: TextStyle(fontFamily: 'Poppins', fontSize: 12, fontWeight: FontWeight.w700, color: const Color(0xFF40BFFF),),
                              ),
                            ),
                          ],
                        ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          )
    );
  }

}