import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

class SpecialImage extends StatelessWidget {
  final int number;
  final String assets;
  final String categories;
  final double height;
  final double width;
  SpecialImage(
      {this.assets, this.categories, this.height, this.number, this.width});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            categories != null
                ? Image.asset(
                    assets,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  )
                : Image.asset(
                    assets,
                    fit: BoxFit.contain,
                    height: double.infinity,
                  ),
            categories != null
                ? Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF343434).withOpacity(0.4),
                          Color(0xFF343434).withOpacity(0.1),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                    color: kSecondaryColor.withOpacity(0.1),
                  )),
            categories != null
                ? Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.01,
                      vertical: size.height * 0.01,
                    ),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                            text: "$categories\n",
                            style: TextStyle(
                              fontSize: size.height * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: " $number Brands")
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
