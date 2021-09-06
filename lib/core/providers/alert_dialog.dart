import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogs extends StatelessWidget {
  final String message;

  AlertDialogs(this.message);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error"),
      content: Container(
        child: Text(message),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'), // passing false
          child: Text('Close'),
        ),
      ],
    );
  }
}
