import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotifIconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          child: Container(
            // padding: EdgeInsets.symmetric(horizontal: 5),
            width: 17.75,
            height: 20,
            child: FittedBox(
              fit: BoxFit.cover,
              child: ImageIcon(
                AssetImage("assets/images/notif_icon.png"),
                color: Color(0xFF9098B1),
              ),
            ),
          ),
        ),
        Positioned(
          // left: 11,
          // bottom: 11,
          right: 0,
          top: 0,
          child: Container(
            height: 8,
            width: 8,
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.only(top: 3),
            alignment: Alignment.topRight,
            decoration: new BoxDecoration(
              color: Color(0xFFFB7181),
              borderRadius: BorderRadius.circular(66),
            ),
          ),
        ),
      ],
    );
  }
}
