import 'package:flutter/material.dart';
import 'package:shop_app/Screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF000000),
      body: SafeArea(child: Body()),
    );
  }
}
