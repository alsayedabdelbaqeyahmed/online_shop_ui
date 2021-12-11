import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/models/Product.dart';

import 'chose_color_numbler.dart';
import 'product_details_screen.dart';

class Productdetailswidget extends StatelessWidget {
  const Productdetailswidget({
    Key key,
    @required this.size,
    @required this.data,
    @required this.products,
  }) : super(key: key);

  final Size size;
  final ProductDetailsScreen data;
  final Product products;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.02, top: size.height * 0.02),
            child: Text(
              data.products.title,
              style:
                  TextStyle(color: kPrimaryColor, fontSize: size.height * 0.03),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: size.height * 0.07,
              decoration: BoxDecoration(
                color: data.products.isFavourite
                    ? Color(0xffffe6ee)
                    : Color(0xfff5f6f9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.height * 0.02),
                  bottomLeft: Radius.circular(size.height * 0.02),
                ),
              ),
              child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: size.height * 0.04,
                  ),
                  onPressed: () {}),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Padding(
            padding: EdgeInsets.only(left: size.height * 0.02),
            child: Text(
              data.products.description,
              style: TextStyle(
                  color: kSecondaryColor, fontSize: size.height * 0.02),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          TextButton(
            onPressed: () {},
            child: Text(
              'See more Details >',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
          Container(
            //height: size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Row(
              children: [
                Container(
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                )
              ],
            ),
          ),
          ChoseColorAndNumber(data: data, size: size),
        ],
      ),
    );
  }
}
