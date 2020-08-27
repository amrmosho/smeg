import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/app_components/main_body.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/productScreens/category/components/body.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/models/products_categories.dart';

class CategoryScreen extends StatelessWidget {
  static String id = "productes";
  final ProductsCategories category;

  const CategoryScreen(
    this.category, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: INSDefultScreenBackground,
      body: AddMenuScreen(
        act: "",
        title: INSLang.get('category'),
        subtitle: category.title,
        Screen: AppBody(
          child: categoryBody(),
        ),
      ),
    );
  }

  Column categoryBody() {
    return Column(
      children: [
        Expanded(child: Body(this.category)),
      ],
    );
  }
}
