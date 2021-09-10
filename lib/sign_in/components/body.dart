import 'package:flutter/material.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 110),
                  child: Image.asset('assets/images/Icon_Login.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Welcome to E-shop",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: const Color(0xFF223263)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "Sign in to continue",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey),
                  ),
                ),



                // SizedBox(height: SizeConfig.screenHeight * 0.04),
                // Text(
                //   "Welcome Back",
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: getProportionateScreenWidth(28),
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   "Sign in with your email and password  \nor continue with social media",
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
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
                        )),
                    Text(
                      "OR",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey),
                    ),
                    Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Divider(
                            height: 10,
                            thickness: 1,
                            indent: 20,
                          ),
                        )),
                  ],
                ),
                Container(
                  height: 57,
                  margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEBF0FF))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Image.asset("assets/images/google.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Text(
                          "Login with Google",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 57,
                  margin: EdgeInsets.only(top: 10, left: 16, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEBF0FF))),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Image.asset("assets/images/facebook.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 100),
                        child: Text(
                          "Login with facebook",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF40BFFF)),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 10,
                            left: MediaQuery.of(context).size.width * 0.25),
                        child: Text(
                          " Don’t have a account?",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          " Register",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF40BFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                // SizedBox(height: getProportionateScreenHeight(20)),
                // NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
