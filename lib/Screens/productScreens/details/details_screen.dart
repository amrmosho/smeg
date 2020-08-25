import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/homeScreens/home/home.dart';
import 'package:shop_app/Screens/productScreens/cart/cart.dart';
import 'package:shop_app/Screens/productScreens/details/components/body.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/products.dart';

class DetaillsScreen extends StatelessWidget {
  final Product product;
  static String id = "detaills";

  const DetaillsScreen({Key key, this.product}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(product.color),
      body: Body(
        product: this.product,
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(product.color),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          color: kTextColor,
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.id);
          },
        ),
        SizedBox(
          width: kDefultpadding / 2,
        )
      ],
    );
  }
}
