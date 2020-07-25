import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Content product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefultpadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: kDefultpadding),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: product.color),
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: product.color,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
                height: 50,
                child: FlatButton(
                  color: product.color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  onPressed: () {},
                  child: Text(
                    "Buy NOW".toUpperCase(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
