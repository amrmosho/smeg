import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  ItemCard({this.product, this.press});
/*
  const ItemCard({
    Key key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefultpadding),
              decoration: BoxDecoration(
                color: this.product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                  tag: "${product.id}", child: Image.asset(this.product.image)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefultpadding / 4),
            child: Text(
              this.product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${this.product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
