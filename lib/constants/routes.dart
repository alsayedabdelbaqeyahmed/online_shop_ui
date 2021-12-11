import 'package:flutter/cupertino.dart';
import 'package:online_shop_ui/cart/cart_screen.dart';

import 'package:online_shop_ui/complete_profile/otp_screen.dart';
import 'package:online_shop_ui/forget_password/forget_password.dart';
import 'package:online_shop_ui/home/home_screen.dart';
import 'package:online_shop_ui/log_in_sucess/log_in_sucess.dart';

import 'package:online_shop_ui/product_details/product_details_screen.dart';
import 'package:online_shop_ui/profile/profile.dart';

import 'package:online_shop_ui/sign_in_screen/sign_in_screen.dart';
import 'package:online_shop_ui/sign_up/sign_up_screen.dart';
import 'package:online_shop_ui/splash_screen/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeNames: (context) => SplashScreen(),
  SignInScreen.routeNames: (context) => SignInScreen(),
  ForgetPassword.routeNamed: (context) => ForgetPassword(),
  HomeScreen.routNames: (context) => HomeScreen(),
  LogInucess.routeNamed: (context) => LogInucess(),
  SignUpScreen.routeNames: (context) => SignUpScreen(),
  OtpScreen.routeNames: (context) => OtpScreen(),
  ProductDetailsScreen.routeNames: (context) => ProductDetailsScreen(),
  CartScreen.routeNames: (context) => CartScreen(),
  ProfileScreen.routeNames: (context) => ProfileScreen(),
};
