import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

import 'package:online_shop_ui/log_in_sucess/log_in_sucess.dart';
import 'package:online_shop_ui/splash_screen/defult_buttons.dart';

class OtpFormScreen extends StatefulWidget {
  @override
  _OtpFormScreenState createState() => _OtpFormScreenState();
}

class _OtpFormScreenState extends State<OtpFormScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  FocusNode focus2;
  FocusNode focus3;
  FocusNode focus4;

  @override
  void initState() {
    focus2 = FocusNode();
    focus3 = FocusNode();
    focus4 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    super.dispose();
  }

  void nextPage(String val, FocusNode focus) {
    if (val.length == 1) {
      focus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formkey,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              otpinputform(size: size, focusnod: focus2),
              otpinputform(size: size, focus: focus2, focusnod: focus3),
              otpinputform(size: size, focus: focus3, focusnod: focus4),
              otpinputform(size: size, focus: focus4),
            ],
          ),
          SizedBox(height: size.height * 0.15),
          DefultButton(
              press: () => Navigator.of(context)
                  .pushReplacementNamed(LogInucess.routeNamed),
              text: 'Continue')
        ],
      ),
    );
  }

  SizedBox otpinputform({Size size, FocusNode focus, FocusNode focusnod}) {
    return SizedBox(
      width: size.height * 0.1,
      child: TextFormField(
        autofocus: true,
        obscureText: true,
        focusNode: focus,
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: inputdecoretion(size),
        onChanged: (val) {
          focusnod == null && val.length == 1
              ? focus.unfocus()
              : nextPage(val, focusnod);
        },
      ),
    );
  }

  InputDecoration inputdecoretion(Size size) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: size.width * 0.06),
      border: bordershape(size),
      focusedBorder: bordershape(size),
      enabledBorder: bordershape(size),
    );
  }

  OutlineInputBorder bordershape(Size size) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(size.width * 0.05),
        borderSide: BorderSide(
          color: kPrimaryColor,
        ));
  }
}
