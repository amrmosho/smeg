import 'package:flutter/material.dart';
import 'package:Smeg/Screens/productScreens/details/components/colors_and_size.dart';
import 'package:Smeg/Screens/productScreens/details/components/product_title_with_image.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/data_types.dart';
import 'package:Smeg/models/products.dart';

import 'addtocart.dart';
import 'counter_and_fav_btn.dart';
import 'descrition.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefultpadding,
                    vertical: kDefultpadding,
                  ),
                  height: size.height * 0.4,
                  child: ImagesSlide(product: product),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: kDefultpadding),
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefultpadding,
                    vertical: kDefultpadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColorsAndSize(product: product),
                      SizedBox(height: kDefultpadding),
                      Text(
                        this.product.title,
                        style: TextStyle(color: INSDefultLebalColor),
                      ),
                      Text(
                        this.product.title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: INSDefultLebalColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: kDefultpadding / 2),
                      Description(product: product),
                      SizedBox(height: kDefultpadding / 2),
                      CounterAndFavBtn(product: product),
                      SizedBox(height: kDefultpadding / 2),
                      AddToCart(product: product),
                      SizedBox(height: kDefultpadding / 2),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
