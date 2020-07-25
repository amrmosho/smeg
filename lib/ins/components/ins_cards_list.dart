import 'package:flutter/material.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/constants.dart';

import '../data_types.dart';

class INSCardsList extends StatelessWidget {
  const INSCardsList({
    Key key,
    this.title,
    this.more,
    this.press,
    this.listHeight,
    this.contents,
  }) : super(key: key);
  final String title;
  final List<Content> contents;
  final String more;
  final Function press;
  final double listHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: (more == null)
              ? Text("")
              : Row(
                  children: <Widget>[
                    Text(title),
                    Spacer(),
                    FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: kPrimaryColor,
                      onPressed: press,
                      child: Text(
                        more,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
        ),
        ListBody(
          contents: contents,
          listHeight: listHeight,
        )
      ],
    );
  }
}

class ListBody extends StatelessWidget {
  const ListBody({
    Key key,
    this.listHeight,
    this.contents,
  }) : super(key: key);

  final double listHeight;
  final List<Content> contents;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: (listHeight == null) ? INSListCardSHeight : listHeight,
      child: ListView.builder(
        addAutomaticKeepAlives: false,
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ItemCard(
            product: contents[index], listCardDefultMargin: this.listHeight),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Function press;
  final int index;
  final Content product;
  final double listCardDefultMargin;
  ItemCard({this.index, this.product, this.press, this.listCardDefultMargin});
  double listCardDefultMargi = 5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(INSListCardDefultPadding),
        padding: const EdgeInsets.all(INSListCardDefultPadding),
        decoration: BoxDecoration(
          color: INSListCardDefultBackground,
          borderRadius:
              BorderRadius.circular(INSListCardDefultImageBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(INSListCardImageDefultPadding),
                decoration: BoxDecoration(
                  color: this.product.color,
                  borderRadius:
                      BorderRadius.circular(INSListCardDefultImageBorderRadius),
                ),
                child: Hero(
                    tag: "${product.id}",
                    child: Image.asset(this.product.image)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefultpadding / 4),
              child: Text(
                this.product.title,
                style: TextStyle(color: kTextLightColor),
              ),
            ),
            (this.product.price == null)
                ? Text("")
                : Text(
                    "\$${this.product.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
