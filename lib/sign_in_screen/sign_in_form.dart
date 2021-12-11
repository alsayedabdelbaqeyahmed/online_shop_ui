import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/forget_password/forget_password.dart';
import 'package:online_shop_ui/models/user.dart';
import 'package:online_shop_ui/provider/user_provider.dart';
import 'package:online_shop_ui/splash_screen/defult_buttons.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool rember = false;
  final Map<String, dynamic> signInData = {
    'email': '',
    'password': '',
  };
  FocusNode passwordfocus;
  @override
  void initState() {
    passwordfocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    passwordfocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formkey,
      child: Column(
        children: [
          emailform('Enter Your Email', 'Email', 'assets/icons/Mail.svg',
              signInData, size),
          SizedBox(height: size.height * 0.04),
          passform('Enter Your Password', 'Password', 'assets/icons/Lock.svg',
              signInData, size),
          SizedBox(height: size.height * 0.015),
          Row(
            children: [
              Checkbox(
                value: rember,
                onChanged: (value) => setState(() {
                  rember = value;
                }),
              ),
              Text(
                'Remeber me',
              ),
              Spacer(),
              TextButton(
                child: Text(
                  'Forget Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(ForgetPassword.routeNamed),
              )
            ],
          ),
          SizedBox(height: size.height * 0.025),
          DefultButton(
            text: 'Continue',
            press: () async {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                await Provider.of<UserProvider>(context, listen: false)
                    .logInNewUser(
                  User(
                    email: signInData['email'],
                    password: signInData['password'],
                  ),
                  context,
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget emailform(String hint, String lable, String assets,
      Map<String, dynamic> signInData, Size size) {
    return TextFormField(
      autofocus: true,
      // focusNode: emailfocus,
      onFieldSubmitted: (val) {
        passwordfocus.requestFocus();
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: lable,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: imageMethod(
          size,
          assets,
        ),
      ),
      onSaved: (value) {
        setState(() {
          signInData['email'] = value;
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

  Widget passform(String hint, String lable, String assets,
      Map<String, dynamic> signInData, Size size) {
    return TextFormField(
      obscureText: true,
      focusNode: passwordfocus,
      // onChanged: (val) {
      //   passwordfocus.unfocus();
      // },
      // onFieldSubmitted: (val) {
      //   passwordfocus.unfocus();
      // },
      onChanged: (val) {
        if (val.length == signInData['password']) passwordfocus.unfocus();
      },
      decoration: InputDecoration(
        hintText: hint,
        labelText: lable,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: imageMethod(
          size,
          assets,
        ),
      ),
      onSaved: (value) {
        setState(() {
          signInData['password'] = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
    );
  }
}
