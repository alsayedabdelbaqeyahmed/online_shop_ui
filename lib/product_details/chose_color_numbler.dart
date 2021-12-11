import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/product_details/addtochart.dart';

import 'product_details_screen.dart';

class ChoseColorAndNumber extends StatefulWidget {
  ChoseColorAndNumber({
    Key key,
    @required this.data,
    @required this.size,
    this.text,
  }) : super(key: key);

  final ProductDetailsScreen data;
  final Size size;
  final String text;

  @override
  _ChoseColorAndNumberState createState() => _ChoseColorAndNumberState();
}

class _ChoseColorAndNumberState extends State<ChoseColorAndNumber> {
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.size.height * 0.02),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: widget.data.products.colors[selectedColor] != Colors.white
            ? widget.data.products.colors[selectedColor].withOpacity(0.3)
            : kSecondaryColor.withOpacity(0.3),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: widget.size.width * 0.57,
                  height: widget.size.height * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.data.products.colors.length,
                    itemBuilder: (ctx, index) => choseColor(index),
                  ),
                ),
                buttons(Icons.remove),
                SizedBox(width: widget.size.height * 0.01),
                buttons(Icons.add),
              ],
            ),
          ),
          AddToChartButton(data: widget.data, selectedColor: selectedColor)
        ],
      ),
    );
  }

  Container buttons(IconData icons) {
    return Container(
      margin: EdgeInsets.only(right: widget.size.height * 0.02),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () {},
        child: Icon(icons),
      ),
    );
  }

  Widget choseColor(int index) {
    return Container(
      width: widget.size.height * .05,
      // height: size.height,

      margin: EdgeInsets.only(left: widget.size.height * 0.015),
      padding: selectedColor == index
          ? EdgeInsets.all(widget.size.height * 0.005)
          : EdgeInsets.zero,
      // height: size.height * 0.1,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            color: selectedColor == index ? kPrimaryColor : Colors.transparent),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedColor = index;
          });
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.data.products.colors[index],
          ),
        ),
      ),
    );
  }
}
