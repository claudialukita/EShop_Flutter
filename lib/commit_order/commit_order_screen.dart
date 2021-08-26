import 'package:eshop_flutter/commit_order/widgets/failed_commit_widget.dart';
import 'package:eshop_flutter/commit_order/widgets/success_commit_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommitOrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var paymentStatus = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: paymentStatus == "Success" ?
      SuccessCommitWidget() :
        FailedCommitWidget(),
    );
  }

}