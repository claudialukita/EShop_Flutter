import 'package:eshop_flutter/core/common/constant.dart';
import 'package:eshop_flutter/core/components/form_error.dart';
import 'package:eshop_flutter/core/helper/keyboard.dart';
import 'package:eshop_flutter/sign_in/components/sign_form_state.dart';
import 'package:eshop_flutter/sign_in/components/sign_form_view_model.dart';
import 'package:eshop_flutter/sign_in/sign_in_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shop_app/components/custom_surfix_icon.dart';
// import 'package:shop_app/components/form_error.dart';
// import 'package:shop_app/helper/keyboard.dart';
// import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
// import 'package:shop_app/screens/sign_in/components/sign_form_state.dart';
// import 'package:shop_app/screens/sign_in/components/sign_form_view_model.dart';
// import 'package:shop_app/screens/sign_in/sign_in_view_model.dart';
//
// import '../../../components/default_button.dart';
// import '../../../constants.dart';
// import '../../../size_config.dart';

class SignForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    SignFormState state = watch(signFormViewModelProvider);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 28),
          buildEmailFormField(context),
          SizedBox(height: 16),
          buildPasswordFormField(context),
          SizedBox(height: 16),
          // Row(
          //   children: [
          //     Checkbox(
          //       value: state.isRemember,
          //       activeColor: kPrimaryColor,
          //       onChanged: (value) {},
          //     ),
          //     Text("Remember me"),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: () => Navigator.pushNamed(
          //           context, ForgotPasswordScreen.routeName),
          //       child: Text(
          //         "Forgot Password",
          //         style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     )
          //   ],
          // ),
          FormError(errors: state.errors),
          SizedBox(height: 20),
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
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  context.read(signInViewModelProvider.notifier).login(
                      _emailTextController.text, _passwordTextController.text);
//                Navigator.pushNamed(context, HomeScreen.routeName);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField(BuildContext context) {
    return TextFormField(
      key: Key("sign_form_text_input_password"),
      obscureText: true,
      controller: _passwordTextController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context
              .read(signFormViewModelProvider.notifier)
              .removeError(kPassNullError);
        } else if (value.length >= 4) {
          context
              .read(signFormViewModelProvider.notifier)
              .removeError(kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          context
              .read(signFormViewModelProvider.notifier)
              .addError(kPassNullError);
          return "";
        } else if (value.length < 4) {
          context
              .read(signFormViewModelProvider.notifier)
              .addError(kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock_outline),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color(0xFFEBF0FF), width: 1.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color(0xFFEBF0FF), width: 1.0),
        ),
        hintText: 'Password',
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: const Color(0xFF9098B1)),
        // labelText: "Password",
        // hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField(BuildContext context) {
    return TextFormField(
      key: Key("sign_form_text_input_email"),
      keyboardType: TextInputType.emailAddress,
      controller: _emailTextController,
      onChanged: (value) {
        if (value.isNotEmpty) {
          context
              .read(signFormViewModelProvider.notifier)
              .removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          context
              .read(signFormViewModelProvider.notifier)
              .removeError(kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          context
              .read(signFormViewModelProvider.notifier)
              .addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          context
              .read(signFormViewModelProvider.notifier)
              .addError(kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color(0xFFEBF0FF), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: const Color(0xFFEBF0FF), width: 1.0),
        ),
        hintText: 'Your Email',
        hintStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: const Color(0xFF9098B1)),
        // labelText: "Email",
        // hintText: "Your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
