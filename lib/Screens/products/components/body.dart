import 'package:flutter/material.dart';
import 'package:shop_app/Screens/details/details_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';

import 'Item_card.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefultpadding),
          child: Text("Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefultpadding / 4),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: kDefultpadding,
                  crossAxisSpacing: kDefultpadding,
                  crossAxisCount: 2,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaillsScreen(
                          product: products[index],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        )
      ],
    );
  }
}
