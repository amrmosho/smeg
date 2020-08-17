import 'package:flutter/material.dart';
import 'package:shop_app/Screens/homeScreens/products/products.dart';
import 'package:shop_app/Screens/productScreens/cart/cart.dart';
import 'package:shop_app/Screens/productScreens/checkout/checkout.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/Screens/start/splash.dart';

import 'package:shop_app/Screens/start/start.dart';
import 'Screens/homeScreens/home/home.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ProductesScreen.id: (context) => ProductesScreen(),
        DetaillsScreen.id: (context) => DetaillsScreen(),
        CartScreen.id: (context) => CartScreen(),
        StartScreen.id: (context) => StartScreen(),
        CheckoutScreen.id: (context) => CheckoutScreen()
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
