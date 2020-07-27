import 'package:flutter/material.dart';
import 'package:shop_app/app_components/screen_title.dart';

class CartScreen extends StatelessWidget {
  static String id = "cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ScreenTitle(
            title: "Cart",
          ),
        ),
      ),
    );
  }
}
