import 'package:flutter/material.dart';
import 'package:shop_app/Screens/details/components/colors_and_size.dart';

class ButtonData {
  final String title;
  final IconData icon;
  final Color color;
  final Color background;
  ButtonData({this.icon, this.title, this.color, this.background});
}

List<ButtonData> NavMenu = [
  ButtonData(
    icon: Icons.home,
    title: "Home",
  ),
  ButtonData(
    icon: Icons.shopping_cart,
    title: "products",
  ),
  ButtonData(
    icon: Icons.settings,
    title: "Settings",
  ),
  ButtonData(
    icon: Icons.exit_to_app,
    title: "Logout",
  )
];
