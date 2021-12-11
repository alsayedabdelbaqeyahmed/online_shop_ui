import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_shop_ui/home/home_screen.dart';
import 'package:online_shop_ui/provider/user/user_provider.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'constants/routes.dart';
import 'constants/theme_style.dart';
import 'provider/user/user_profile__provider.dart';
import 'splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  final keyApplicationId = '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad';
  final keyClientKey = '3oWBPJbutu5eykgpqKpcpZW6O7F7JJ5sHgxJX4Ax';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true, debug: true);
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<UserImageProvider>(
          create: (context) => UserImageProvider(),
        ),
      ],
      child: Consumer<UserProvider>(
        builder: (ctx, user, ch) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Shop',
          theme: themeStyle(),
          home: FutureBuilder(
            future: user.autoAuthentication(),
            builder: (ctx, data) {
              return data.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : data.data == true
                      ? HomeScreen()
                      : SplashScreen();
            },
          ),
          routes: routes,
        ),
      ),
    );
  }
}
