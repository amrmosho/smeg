import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/Screens/category/components/body.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/data_types.dart';

class CategoryScreen extends StatelessWidget {
  static String id = "productes";
  final Content category;

  const CategoryScreen(
    this.category, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: INSDefultScreenBackground,
      body: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 100,
            child: ScreenTitle(
              title: "Category",
              subtitle: category.title,
            ),
          ),
          Expanded(child: Body(this.category)),
        ],
      ),
    );
  }

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
  }
}
