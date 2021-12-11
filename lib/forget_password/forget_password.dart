import 'package:flutter/material.dart';
import 'package:online_shop_ui/forget_password/forget_password_form.dart';

class ForgetPassword extends StatelessWidget {
  static const String routeNamed = 'forget_password';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.03),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.07),
                  Text(
                    'Forget Password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.07,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' Please enter your email and we will send \nyou a link to return to your account,',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.14),
                  ForgetPasswordForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
