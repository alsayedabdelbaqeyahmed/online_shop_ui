import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

class SplashScreenContentWidget extends StatelessWidget {
  final String subTitle;
  final String imageAssets;

  const SplashScreenContentWidget({
    this.subTitle,
    this.imageAssets,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Spacer(), // 1 of 3
        Text(
          'TRADE LINE',
          style: TextStyle(
            fontSize: size.height * 0.055,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2), // 2of 3
        Image.asset(
          imageAssets,
          height: size.height * 0.35,
          width: size.width * 0.6,
        ),
      ],
    );
  }
}
