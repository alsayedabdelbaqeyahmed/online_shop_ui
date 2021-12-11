import 'package:flutter/material.dart';
import 'package:online_shop_ui/sign_in_screen/social_media.dart';

import 'sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const routeNames = 'Sign_Up';
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
                      'Register Account',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Complete your Details or continue  \n with social media",
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: size.height * 0.08),
                    SignUpForm(),
                    SizedBox(height: size.height * 0.09),
                    SocialMediaByuutons(
                      text2:
                          "By Continie you confirm that you agree  \nwith our term conditions",
                    ),
                    SizedBox(height: size.height * 0.07),
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
