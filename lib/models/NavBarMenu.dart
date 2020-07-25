import 'package:flutter/material.dart';
import 'package:shop_app/Screens/home/home.dart';
import 'package:shop_app/Screens/products/products.dart';

class ButtonData {
  final String title;
  final IconData icon;
  final Color color;
  final Color background;
  final Function onpress;
  final String goto;

  ButtonData(
      {this.goto,
      this.icon,
      this.onpress,
      this.title,
      this.color,
      this.background});
}

List<ButtonData> NavMenu = [
  ButtonData(icon: Icons.home, title: "Home"),
  ButtonData(icon: Icons.shopping_cart, title: "products"),
  ButtonData(
    icon: Icons.settings,
    title: "Settings",
  ),
  ButtonData(
    icon: Icons.exit_to_app,
    title: "Logout",
  )
];
