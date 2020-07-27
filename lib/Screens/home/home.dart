import 'package:flutter/material.dart';
import 'package:shop_app/Screens/home/components/body.dart';
import 'package:shop_app/app_components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFfafafa),
      appBar: buildAppBar(),
      body: Body(),
    );
  }
}
