import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

import 'product_details_screen.dart';

class AddToChartButton extends StatelessWidget {
  final int selectedColor;
    final ProductDetailsScreen data;



  const AddToChartButton({Key key, this.selectedColor , this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
          left: size.height * 0.03,
          right: size.height * 0.03,
          bottom: size.height * 0.03,
          top: size.height * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Colors.white,
      ),
      child: SizedBox(
        height: size.height * 0.1,
        width: double.infinity,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => data.products.colors[selectedColor] != Colors.white
                  ? data.products.colors[selectedColor]
                  : kPrimaryColor,
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.zero,
            ),
            shape: MaterialStateProperty.all(
              (RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
          ),
          // color: kPrimaryColor,
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.01),
            child: Text(
              'Add to Cart',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height *
                      0.038), // بلاش استخدام العرض كمقياس لانفي الويب العلرض اكبر من الطول
              // وبالتالي هيبقي كبير جدا عن لو استخدمت الطول
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
