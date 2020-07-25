import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/Screens/products/components/body.dart';
import 'package:shop_app/constants.dart';

class ProductesScreen extends StatelessWidget {
  static String id = "productes";
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: Body());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      ),
      actions: [
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
    );
  }
}
