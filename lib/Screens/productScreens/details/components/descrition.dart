import 'package:flutter/material.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/models/products.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefultpadding, horizontal: kDefultpadding / 4),
      child: Text(
        product.des,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
