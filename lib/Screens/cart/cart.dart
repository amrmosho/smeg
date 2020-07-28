import 'package:flutter/material.dart';
import 'package:shop_app/app_components/screen_title.dart';

import '../../constants.dart';

class CartScreen extends StatelessWidget {
  static String id = "cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
          decoration: BoxDecoration(
              color: Color(0xfff0eef0),
              borderRadius: BorderRadius.all(Radius.circular(INSDefultRadius))),
        ),
      ),
    );
  }
}
