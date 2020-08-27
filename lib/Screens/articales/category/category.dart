import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/Screens/productScreens/category/components/body.dart';
import 'package:Smeg/app_components/screen_title.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/models/products_categories.dart';

class ConetnCategoryScreen extends StatelessWidget {
  static String id = "productes";
  final ProductsCategories category;

  const ConetnCategoryScreen(
    this.category, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AddMenuScreen(
      title: INSLang.get("category"),
      Screen: Expanded(child: Body(this.category)),
    );

    /*
    
     Scaffold(
      backgroundColor: INSDefultScreenBackground,
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            child: ScreenTitle(
              title: INSLang.get("category"),
              subtitle: category.title,
            ),
          ),
          Expanded(child: Body(this.category)),
        ],
      ),
    );*/
  }

/*

  body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            child: ScreenTitle(
              title: INSLang.get("category"),
              subtitle: category.title,
            ),
          ),
          Expanded(child: Body(this.category)),
        ],
      ),
  Widget buildAppBar(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      //  backgroundColor: INSDefultScreenBackground,
      //   elevation: 0,
      child: Row(
        children: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/back.svg"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Image.asset(
            "assets/images/smeg_logo.png",
            width: 100,
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/search.svg",
              color: kTextColor,
            ),
            onPressed: () {},
            color: kTextColor,
          ),
          IconButton(
            icon: SvgPicture.asset(
              "assets/icons/cart.svg",
              color: kTextColor,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: kDefultpadding / 2,
          )
        ],
      ),
    );
  }*/
}
