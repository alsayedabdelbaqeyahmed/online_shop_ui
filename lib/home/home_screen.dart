import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:online_shop_ui/constants/enum.dart';
import 'package:online_shop_ui/home/categories.dart';
import 'package:online_shop_ui/home/offer_bar.dart';
import 'package:online_shop_ui/home/popular.dart';
import 'package:online_shop_ui/home/special_offer.dart';
import 'package:online_shop_ui/profile/bottom_bar.dart';

import 'home_top_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routNames = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomBaer(
        select: SelectIcon.home,
        selectBage: conbuyerHome,
        icon: FontAwesomeIcons.store,
        icon2: FontAwesomeIcons.moneyCheckAlt,
        icon3: FontAwesomeIcons.comments,
        icon4: FontAwesomeIcons.user,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: size.height * 0.02,
            end: size.height * 0.02,
            top: size.height * 0.03,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeTopBar(),
                SizedBox(height: size.height * 0.03),
                OfferBar(),
                SizedBox(height: size.height * 0.03),
                Categories(),
                SizedBox(height: size.height * 0.03),
                specialForYou(size, 'Special For You', 'See More'),
                SizedBox(height: size.height * 0.03),
                SpecialOffer(),
                SizedBox(height: size.height * 0.03),
                specialForYou(size, 'Popular Products', 'See More'),
                SizedBox(height: size.height * 0.03),
                Popular(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row specialForYou(Size size, String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: size.height * 0.03,
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            text2,
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}
