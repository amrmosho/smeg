import 'package:flutter/material.dart';
import 'package:Smeg/ins/data_types.dart';
import 'package:Smeg/ins/lang.dart';

List<ButtonData> NavMenu = [
  ButtonData(
    icon: Icons.home,
    title: INSLang.get("home"),
  ),
  ButtonData(
    icon: Icons.shopping_cart,
    title: INSLang.get("products"),
  ),
  ButtonData(
    icon: Icons.book,
    title: INSLang.get("news"),
  ),
  ButtonData(
    icon: Icons.mail,
    title: INSLang.get("contactus"),
  )
];
