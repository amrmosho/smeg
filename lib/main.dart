import 'package:flutter/material.dart';
import 'package:shop_app/Screens/details/details_screen.dart';
import 'package:shop_app/Screens/products/products.dart';
import 'package:shop_app/Screens/start/start.dart';
import 'constants.dart';
import 'Screens/home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        ProductesScreen.id: (context) => ProductesScreen(),
        DetaillsScreen.id: (context) => DetaillsScreen(),
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartScreen(),
    );
  }
}
