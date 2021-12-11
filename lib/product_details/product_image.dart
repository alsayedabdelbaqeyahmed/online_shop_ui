import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/product_details/product_details_screen.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({
    Key key,
    this.product,
    @required this.size,
  }) : super(key: key);

  final Size size;
  final ProductDetailsScreen product;

  @override
  _ProductImageState createState() => _ProductImageState();
}

int selectedImage = 0;

class _ProductImageState extends State<ProductImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      color: Colors.grey.shade200,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: widget.size.height * 0.03,
                right: widget.size.height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: widget.size.height * 0.084,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            widget.product.products.rating.toString(),
                            style: TextStyle(
                                fontSize: widget.size.height * 0.02,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: widget.size.height * 0.03,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: widget.size.height * 0.04),
          Hero(
            tag: widget.product.products.id,
            child: Container(
              height: widget.size.height * 0.18,
              child: Image.asset(
                widget.product.products.images[selectedImage],
                fit: BoxFit.contain,
              ),
            ),
          ),
          // SizedBox(height: widget.size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                widget.product.products.images.length,
                (index) => previewImage(index),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget previewImage(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        height: widget.size.height * 0.07,
        width: widget.size.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0),
          ),
        ),
        child: Image.asset(
          widget.product.products.images[index],
        ),
      ),
    );
  }
}
