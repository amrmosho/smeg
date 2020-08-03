import 'package:flutter/material.dart';

class Content {
  final int price, size, id;
  int num;

  final String image, title, description, cat_id, images;
  final Color color;
  Content({
    this.id,
    this.images,
    this.cat_id,
    this.image,
    this.title,
    this.description,
    this.price,
    this.size,
    this.color,
    this.num,
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

class INSData {
  static Content getContentByID(List<Content> conentist, int id) {
    return conentist.where((l) => (l.id == id)).toList()[0];
  }

  static List<Content> getContentByCatID(List<Content> conentist, int cat_id) {
    if (cat_id == 0) {
      return conentist
          .where(
              (l) => /*l.cat_id.split(",").contains("0") ||*/ l.cat_id == null)
          .toList();
    } else {
      return conentist
          .where((l) =>
              l.cat_id != null &&
              l.cat_id.split(",").contains(cat_id.toString()))
          .toList();
    }
  }
}
