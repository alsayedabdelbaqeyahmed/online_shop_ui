import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'new_user.dart';

class SocialMediaByuutons extends StatelessWidget {
  final String text2;

  const SocialMediaByuutons({Key key, this.text2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            newMethod(
                size, 'assets/icons/google-icon.svg', () {}, size.width * 0.04),
            newMethod(
                size, 'assets/icons/facebook-2.svg', () {}, size.width * 0.03),
            newMethod(
                size, 'assets/icons/twitter.svg', () {}, size.width * 0.04),
          ],
        ),
        SizedBox(height: size.height * 0.02),
        text2 != null
            ? NewUser(
                size: size,
                text: text2,
              )
            : NewUser(
                size: size,
              )
      ],
    );
  }

  GestureDetector newMethod(
      Size size, String asset, Function press, double value) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: size.width * 0.13,
        height: size.width * 0.13,
        padding: EdgeInsets.all(value),
        margin: EdgeInsets.all(size.width * 0.015),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
        ),
        child: SvgPicture.asset(
          asset,
          // width: size.width * 0.04,
          // height: size.width * 0.04,
        ),
      ),
    );
  }
}
