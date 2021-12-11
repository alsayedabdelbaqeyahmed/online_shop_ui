import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/sign_in_screen/new_user.dart';
import 'package:online_shop_ui/splash_screen/defult_buttons.dart';

class ForgetPasswordForm extends StatefulWidget {
  @override
  _ForgetPasswordFormState createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  String email;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formkey,
      child: Column(
        children: [
          form(size, 'assets/icons/Mail.svg'),
          SizedBox(height: size.height * 0.16),
          DefultButton(
            press: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
              }
            },
            text: 'Continue',
          ),
          SizedBox(height: size.height * 0.1),
          NewUser(size: size)
        ],
      ),
    );
  }

  TextFormField form(Size size, String assets) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'enter your email',
        labelText: 'Email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: imageMethod(
          size,
          assets,
        ),
      ),
      onSaved: (val) {
        setState(() {
          email = val;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return kEmailNullError;
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
    );
  }
}
