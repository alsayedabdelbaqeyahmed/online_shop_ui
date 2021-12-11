import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMenue extends StatelessWidget {
  final String icon;
  final String name;
  final Function press;

  const ProfileMenue({Key key, this.icon, this.name, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding:
          EdgeInsets.only(left: size.height * 0.03, right: size.height * 0.01),
      // width: size.width * 0.8,
      height: size.width * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // border: Border.all(color: Colors.red),
        color: kSecondaryColor.withOpacity(.1),
      ),
      child: Row(
        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(icon,
              color: kPrimaryColor, height: size.height * 0.035),
          SizedBox(width: size.height * 0.03),
          Expanded(
            child: Text(
              name,
              style: TextStyle(fontSize: size.height * 0.03),
            ),
          ),
          IconButton(
              icon: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                height: size.height * 0.03,
                color: kPrimaryColor,
              ),
              onPressed: press),
        ],
      ),
    );
  }
}
