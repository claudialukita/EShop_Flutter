import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatelessWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 65, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 65),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF223263), offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 22, color: Color(0xFF223263)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                descriptions,
                style: TextStyle(fontSize: 14, color: Color(0xFF223263)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
