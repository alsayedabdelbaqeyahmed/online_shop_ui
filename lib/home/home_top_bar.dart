import 'package:flutter/material.dart';
import 'package:online_shop_ui/cart/cart_screen.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_shop_ui/provider/user/user_provider.dart';
import 'package:provider/provider.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({
    Key key,
  }) : super(key: key);
  // int numbrofItems = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.height * 0.33,
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'search products',
                contentPadding: EdgeInsets.symmetric(
                    horizontal: size.height * .04, vertical: size.height * .02),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
              onSaved: (val) {},
              validator: (val) {
                return val;
              },
            ),
          ),
          SizedBox(width: size.height * 0.01),
          notificationIcon(
            size,
            0,
            'assets/icons/Cart Icon.svg',
            () => Navigator.of(context).pushNamed(CartScreen.routeNames),
          ),
          SizedBox(width: size.height * 0.01),
          notificationIcon(
            size,
            2,
            'assets/icons/Bell.svg',
            () =>
                Provider.of<UserProvider>(context, listen: false).getuserInfo(),
          ),
        ],
      ),
    );
  }

  Stack notificationIcon(Size size, int number, String assets, Function press) {
    return Stack(
      // clipBehavior: Clip. ,
      // overflow: Overflow.visible,
      clipBehavior: Clip.none,
      children: [
        Container(
          // padding: EdgeInsets.all(size.height * 0.01),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor.withOpacity(.1),
          ),
          child: IconButton(
              icon: SvgPicture.asset(
                assets,
                color: Colors.green,
              ),
              onPressed: press),
        ),
        notification(size, number),
      ],
    );
  }

  Widget notification(Size size, int numb) {
    return numb != 0
        ? Positioned(
            top: -3,
            right: 0,
            height: size.height * 0.025,
            width: size.height * 0.025,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(width: 1.5, color: Colors.white),
              ),
              child: Text(
                '$numb',
                style: TextStyle(
                  color: Colors.white,
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : SizedBox.shrink();
  }
}
