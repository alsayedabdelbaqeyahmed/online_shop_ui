import 'package:flutter/material.dart';
import 'package:online_shop_ui/models/Product.dart';

import 'product_details_widget.dart';
import 'product_image.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeNames = 'product_details';
  final Product products;

  const ProductDetailsScreen({
    Key key,
    this.products,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProductDetailsScreen data = ModalRoute.of(context).settings.arguments;
    // بعت الداتا من خلال انه استخدم الصفحه ده كوسيط تستقبل الداتا
    // وبعدين هناك اعمل اوبجكت منها واستدعي الداتا من خلال الاوبجكت ده
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      //  appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: ProductImage(size: size, product: data),
              ),
              SizedBox(height: size.height * 0.02),
              Productdetailswidget(size: size, data: data, products: products),
            ],
          ),
        ),
      ),
    );
  }
}
