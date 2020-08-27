import 'package:Smeg/Screens/homeScreens/home/home.dart';
import 'package:Smeg/constants.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/start/start.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/Screens/homeScreens/products/products.dart';
import 'package:Smeg/Screens/productScreens/cart/cart.dart';
import 'package:Smeg/Screens/productScreens/checkout/checkout.dart';
import 'package:Smeg/Screens/productScreens/details/details_screen.dart';
import 'package:Smeg/Screens/settings/setting.dart';
import 'package:Smeg/Screens/start/splash.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppScreen extends StatefulWidget {
  static String id = "splash22";

  @override
  _AppScreenState createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  String _stat = INSLang.get("checkdata");
  var _update = true;
  @override
  void initState() {
    super.initState();
    INSLang.get_lang(onDone: () {
      setState(() {
        _update = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _update
        ? Container()
        : MaterialApp(
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', ''),
              const Locale('ar', ''),
            ],
            locale: INSLang.isRTL() ? Locale('ar') : Locale('en'),
            debugShowCheckedModeBanner: false,
            title: 'Smeg',
            routes: {
              SplashScreen.id: (context) => SplashScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              ProductesScreen.id: (context) => ProductesScreen(),
              DetaillsScreen.id: (context) => DetaillsScreen(),
              CartScreen.id: (context) => CartScreen(),
              StartScreen.id: (context) => StartScreen(),
              CheckoutScreen.id: (context) => CheckoutScreen(),
              SettingsScreen.id: (context) => SettingsScreen(),
              AppScreen.id: (context) => AppScreen()
            },
            theme: ThemeData(
              textTheme:
                  Theme.of(context).textTheme.apply(bodyColor: kTextColor),
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(),
          );
  }
}
