import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    // Navigator.pushReplacementNamed(context, "/login");
    Navigator.pushReplacementNamed(context, "/profile");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF40BFFF),
        child: Center(
          child: Container(
              child: Image.asset('assets/images/Icon_splash.png'),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white)),
        ),
      ),
    );
  }
}
