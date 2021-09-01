import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/login/login_view_model.dart';
import 'package:eshop_flutter/login/widgets/login_validation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends StatelessWidget {

  // @override
  // void initState() {
  //   super.initState();
  // }
  //
  // @override
  // void dispose() {
  //   _passController.dispose();
  //   _emailController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LoginValidationWidget()
    );
  }
}
