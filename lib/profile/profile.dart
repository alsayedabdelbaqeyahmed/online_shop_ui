import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:online_shop_ui/constants/enum.dart';
import 'package:online_shop_ui/profile/bottom_bar.dart';
import 'package:online_shop_ui/profile/profile_men.dart';
import 'package:online_shop_ui/profile/profile_pic.dart';
import 'package:online_shop_ui/provider/user/user_provider.dart';
import 'package:online_shop_ui/sign_in_screen/sign_in_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeNames = 'profile';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomBaer(
        select: SelectIcon.profile,
        selectBage: conbuyerprofile,
        icon: FontAwesomeIcons.store,
        icon2: FontAwesomeIcons.moneyCheckAlt,
        icon3: FontAwesomeIcons.comments,
        icon4: FontAwesomeIcons.user,
      ),
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.height * 0.03,
            right: size.height * 0.03,
            top: size.height * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfilePic(),
                SizedBox(height: size.height * 0.04),
                ProfileMenue(
                    icon: 'assets/icons/User.svg',
                    name: 'My Account',
                    press: () {}),
                SizedBox(height: size.height * 0.04),
                ProfileMenue(
                    icon: 'assets/icons/Bell.svg',
                    name: 'Notifications',
                    press: () {}),
                SizedBox(height: size.height * 0.04),
                ProfileMenue(
                    icon: 'assets/icons/Settings.svg',
                    name: 'Settings',
                    press: () {}),
                SizedBox(height: size.height * 0.04),
                ProfileMenue(
                    icon: 'assets/icons/Question mark.svg',
                    name: 'Help Center',
                    press: () {}),
                SizedBox(height: size.height * 0.04),
                InkWell(
                  onTap: () {
                    Provider.of<UserProvider>(context, listen: false)
                        .logOut()
                        .then(
                          (value) => Navigator.of(context)
                              .pushNamedAndRemoveUntil(
                                  SignInScreen.routeNames, (route) => false),
                        );
                  },
                  child: ProfileMenue(
                    icon: 'assets/icons/Log out.svg',
                    name: 'Log Out',
                    press: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .logOut()
                          .then(
                            (value) => Navigator.of(context)
                                .pushNamedAndRemoveUntil(
                                    SignInScreen.routeNames, (route) => false),
                          );
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
