import 'package:flutter/material.dart';
import 'package:shop_app/Screens/details/components/colors_and_size.dart';
import 'package:shop_app/Screens/details/components/product_title_with_image.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';

import 'addtocart.dart';
import 'counter_and_fav_btn.dart';
import 'descrition.dart';

class Body extends StatelessWidget {
  final Content product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefultpadding,
                      right: kDefultpadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorsAndSize(product: product),
                      SizedBox(height: kDefultpadding / 2),
                      Description(product: product),
                      SizedBox(height: kDefultpadding / 2),
                      CounterAndFavBtn(product: product),
                      SizedBox(height: kDefultpadding / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitleWithImage(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
