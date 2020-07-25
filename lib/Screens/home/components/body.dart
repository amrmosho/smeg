import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/components/ins_cards_list.dart';
import 'package:shop_app/models/Product.dart';

import 'featurred_plants.dart';
import 'header_with_seachbox.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderWithSearchBox(size: size),
          INSCardsList(
            title: "Xxxx",
            press: () => {},
            listHeight: 200,
            contents: news,
          ),
          INSCardsList(
            title: "Xxxx",
            press: () => {},
            listHeight: 400,
            contents: news,
          ),
          INSCardsList(title: "Xxxx", press: () => {}, contents: products),
          FeaturedPlants(),
          SizedBox(height: kDefultpadding),
        ],
      ),
    );
  }
}
