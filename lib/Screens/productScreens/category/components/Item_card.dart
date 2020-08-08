import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/products.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  ItemCard({this.product, this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(INSDefultpadding),
                decoration: BoxDecoration(
                  color: Color(this.product.color),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: INSNet.getImage(this.product.image,
                    heroTag: this.product.id)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: INSDefultpadding / 2,
                horizontal: INSDefultpadding / 2),
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
