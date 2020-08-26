import 'package:flutter/material.dart';
import 'package:shop_app/Screens/menu/get_menu.dart';
import 'package:shop_app/Screens/productScreens/category/components/body.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/models/products_categories.dart';

class CategoryScreen extends StatelessWidget {
  static String id = "productes";
  final ProductsCategories category;

  const CategoryScreen(
    this.category, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddMenuScreen(
        title: INSLang.get("category"),
        subtitle: this.category.title,
        act: "",
        Screen: Container(
          child: AppBody(
            child: Expanded(child: Body(this.category)),
          ),
        ));
  }
}
