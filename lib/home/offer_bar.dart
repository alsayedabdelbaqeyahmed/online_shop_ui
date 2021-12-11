import 'package:flutter/material.dart';

class OfferBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.03, vertical: size.height * 0.015),
      width: size.width,
      height: size.height * 0.13,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "A Summer Surpise\n"),
            TextSpan(
              text: "Cashback 20%",
              style: TextStyle(
                fontSize: size.height * .03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      //   Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   Text(
      //     "A Summer Surpise\n",
      //     style: TextStyle(color: Colors.white),

      //   ),
      //   Text(
      //     "Cashback 20%",
      //     style: TextStyle(
      //         fontSize: size.height * .03,
      //         fontWeight: FontWeight.bold,
      //         color: Colors.white),
      //   //   ),
      //   ],
      // ),
    );
  }
}
