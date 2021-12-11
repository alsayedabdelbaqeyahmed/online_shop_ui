import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/sign_in_screen/sign_in_screen.dart';
import 'package:online_shop_ui/splash_screen/defult_buttons.dart';

import 'splash_screen_content.dart';

class SplashScreen extends StatefulWidget {
  static const routeNames = '/splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //  SizeConfig().init(context);
    final size = MediaQuery.of(context).size;

    List<Map<String, String>> splashData = [
      {
        "text": "Welcome to TRADE LINE, Let’s shop!",
        "image": "assets/images/splash_1.png"
      },
      {
        "text":
            "We help people conect with store \naround United State of America",
        "image": "assets/images/splash_2.png"
      },
      {
        "text": "We show the easy way to shop. \nJust stay at home with us",
        "image": "assets/images/splash_3.png"
      },
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: size.height * 0.03),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  // استخدمها علي شان تاخد كل المساحه المتاحه فقط وبالتالي
                  // لما اقسم المساحات في الويدجت الي جواها تبقي علي حسب المساحه المغطاه ليها وليس الشاشه كلها
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (val) => setState(() {
                      currentPageIndex = val;
                    }),
                    itemBuilder: (ctx, index) => SplashScreenContentWidget(
                      imageAssets: splashData[index]['image'],
                      subTitle: splashData[index]['text'],
                    ),
                    itemCount: splashData.length,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.height * 0.02),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => swipSpot(index),
                          ),
                        ),
                        Spacer(flex: 2),
                        DefultButton(
                          text: 'Continue',
                          press: () => Navigator.of(context)
                              .pushNamed(SignInScreen.routeNames),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer swipSpot(int index) {
    return AnimatedContainer(
      height: 6,
      width: currentPageIndex == index ? 20 : 6,
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: currentPageIndex == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
