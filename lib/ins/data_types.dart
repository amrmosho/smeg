import 'package:flutter/material.dart';

class Content {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Content({
    this.id,
    this.image,
    this.title,
    this.description,
    this.price,
    this.size,
    this.color,
  });
}

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
