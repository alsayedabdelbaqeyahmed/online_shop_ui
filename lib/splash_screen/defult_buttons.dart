import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';

class DefultButton extends StatelessWidget {
  final Function press;
  final String text;

  const DefultButton({Key key, this.press, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.08,
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => kPrimaryColor,
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.all(
            (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
          ),
        ),
        // color: kPrimaryColor,
        onPressed: press,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.01),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: size.height *
                    0.038), // بلاش استخدام العرض كمقياس لانفي الويب العلرض اكبر من الطول
            // وبالتالي هيبقي كبير جدا عن لو استخدمت الطول
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
