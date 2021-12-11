import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/constants/enum.dart';
import 'package:online_shop_ui/home/home_screen.dart';
import 'package:online_shop_ui/profile/profile.dart';

class BottomBaer extends StatelessWidget {
  final SelectIcon select;
  final String selectBage;
  final IconData icon;
  final IconData icon2;
  final IconData icon3;
  final IconData icon4;

  const BottomBaer(
      {Key key,
      this.select,
      this.icon,
      this.icon2,
      this.icon3,
      this.icon4,
      this.selectBage})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(size.height * 0.02),
      height: size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: kPrimaryColor.withOpacity(.1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              icon: FaIcon(
                icon,
                color: select == SelectIcon.sellerStore
                    ? kPrimaryColor
                    : kSecondaryColor,
              ),
              onPressed: () {
                if (selectBage == consellerHome) {
                  return null;
                } else if (selectBage == conbuyerHome) {
                  return null;
                } else if (selectBage == conbuyerprofile) {
                  return Navigator.of(context).pushNamedAndRemoveUntil(
                      HomeScreen.routNames, (route) => false);
                }
              }),
          IconButton(
              icon: FaIcon(
                icon2,
                color: select == SelectIcon.favorite
                    ? kPrimaryColor
                    : kSecondaryColor,
              ),
              onPressed: () {}),
          IconButton(
              icon: FaIcon(
                icon3,
                color:
                    select == SelectIcon.chat ? kPrimaryColor : kSecondaryColor,
              ),
              onPressed: () {}),
          IconButton(
            icon: FaIcon(
              icon4,
              color: select == SelectIcon.profile
                  ? kPrimaryColor
                  : kSecondaryColor,
            ),
            onPressed: () {
              if (selectBage == conbuyerHome) {
                return Navigator.of(context).pushNamedAndRemoveUntil(
                    ProfileScreen.routeNames, (route) => false);
              } else if (selectBage == consellerprofile) {
                return null;
              } else if (selectBage == conbuyerprofile) {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
