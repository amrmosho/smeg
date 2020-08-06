import 'package:flutter/material.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';

import 'package:shop_app/constants.dart';

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Content product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefultpadding, horizontal: kDefultpadding / 4),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}