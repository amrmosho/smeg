import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefultpadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.product.title,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            this.product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Pris\n"),
                      TextSpan(
                          text: "\$${this.product.price}",
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: kDefultpadding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    this.product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
