import 'package:eshop_flutter/core/components/custom_dialog.dart';
import 'package:eshop_flutter/main_tab/main_tab_screen.dart';
import 'package:eshop_flutter/sign_in/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:eshop_flutter/components/custom_dialog.dart';
// import 'package:eshop_flutter/screens/home/home_screen.dart';
// import 'package:eshop_flutter/screens/sign_in/sign_in_view_model.dart';

import 'components/body.dart';

class SignInScreen extends ConsumerWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var state = watch(signInViewModelProvider);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if(state is AsyncData){
        if(state.value != null){
          Navigator.pushNamed(context, '/MainTabScreen');
        }
      }else if(state is AsyncError){
        var error = "";
        if((state.error as dynamic).response != null){
          error = (state.error as dynamic).response.data.toString();
        }else{
          error = "Something went wrong";
        }
        showDialog(
            context: context,
            builder: (context) => CustomDialogBox(
                title: "Error",
                descriptions: error,
                text: "OK"));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
