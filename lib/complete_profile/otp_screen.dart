import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  static const String routeNames = 'OtpScreen';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: size.width * 0.08),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                        fontSize: size.height * 0.04,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text("We sent your code to +1 898 860 ***"),
                  timerMethod(),
                  OtpFormScreen(),
                  SizedBox(height: size.height * 0.15),
                  TextButton(
                    child: Text(
                      "Resend OTP Code",
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row timerMethod() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          duration: Duration(seconds: 30),
          tween: Tween(begin: 30.0, end: 0.0),
          builder: (_, index, child) => Text(
            '00:${index.toInt()}',
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
