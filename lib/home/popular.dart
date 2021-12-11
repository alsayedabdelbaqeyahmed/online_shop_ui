import 'package:flutter/material.dart';
import 'package:online_shop_ui/home/special_imahe.dart';
import 'package:online_shop_ui/models/Product.dart';
import 'package:online_shop_ui/product_details/product_details_screen.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      width: size.width,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    ProductDetailsScreen.routeNames,
                    arguments: ProductDetailsScreen(
                      products: demoProducts[index],
                    ),
                  );
                },
                child: Hero(
                  tag: demoProducts[index].id,
                  child: SpecialImage(
                    assets: demoProducts[index].images[0],
                    width: size.width * .5,
                    height: size.height * 0.2,
                  ),
                ),
              ),
          separatorBuilder: (ctx, index) => SizedBox(
                width: size.height * 0.03,
              ),
          itemCount: demoProducts.length),
    );
  }
}
