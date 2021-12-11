import 'package:flutter/material.dart';

import 'package:online_shop_ui/home/home_screen.dart';

import 'package:online_shop_ui/splash_screen/defult_buttons.dart';

class LogInucess extends StatelessWidget {
  static const String routeNamed = 'login_sucess';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.08),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.4,
                  child: Image.asset(
                    "assets/images/success.png",
                  ),
                ),
                Spacer(),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.06,
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: size.height * 0.6,
                  child: DefultButton(
                    text: "Go to home",
                    press: () async {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          HomeScreen.routNames, (route) => false);
                    },
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
