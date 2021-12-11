import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/sign_up/sign_up_screen.dart';

class NewUser extends StatelessWidget {
  final String text;

  const NewUser({Key key, @required this.size, this.text}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          text == null
              ? Text(
                  'Don\'t have an account?',
                  style: TextStyle(fontSize: size.width * 0.05),
                )
              : Text(
                  text,
                  textAlign: TextAlign.center,
                ),
          text != null
              ? SizedBox.shrink()
              : TextButton(
                  //  padding: EdgeInsets.zero,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: size.width * 0.05, color: kPrimaryColor),
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed(SignUpScreen.routeNames),
                ),
        ],
      ),
    );
  }
}
