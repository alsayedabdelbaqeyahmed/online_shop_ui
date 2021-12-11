import 'package:flutter/material.dart';

import 'package:online_shop_ui/sign_in_screen/sign_in_form.dart';
import 'package:online_shop_ui/sign_in_screen/social_media.dart';

class SignInScreen extends StatelessWidget {
  static const routeNames = 'Sign_In';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.width * 0.08),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Welocme Back',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Sign in with your email and password  \nor continue with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.08),
                    SignInForm(),
                    SizedBox(height: size.height * 0.09),
                    SocialMediaByuutons()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
