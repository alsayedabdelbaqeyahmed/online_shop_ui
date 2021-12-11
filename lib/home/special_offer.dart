
import 'package:flutter/material.dart';
import 'package:online_shop_ui/home/special_imahe.dart';

class SpecialOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SpecialImage(
            number: 5,
            assets: 'assets/images/Image Banner 2.png',
            categories: "Smartphone",
            width: size.width * .7,
            height: size.height * 0.18,
          ),
          SizedBox(width: size.height * 0.02),
          SpecialImage(
            number: 24,
            assets: 'assets/images/Image Banner 3.png',
            categories: "Fashion",
            width: size.width * .7,
            height: size.height * 0.18,
          ),
          SizedBox(width: size.height * 0.02),
          SpecialImage(
            number: 5,
            assets: 'assets/images/Image Banner 2.png',
            categories: "Smartphone",
            width: size.width * .7,
            height: size.height * 0.18,
          ),
        ],
      ),
    );
  }
}
