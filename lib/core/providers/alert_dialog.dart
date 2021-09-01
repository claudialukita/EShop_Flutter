import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error"),
      content: Container(
        child: Text("Something went wrong"),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context)
              .pushNamed("/MainTabScreen"), // passing false
          child: Text('Close'),
        ),
      ],
    );
  }
}
