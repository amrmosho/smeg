import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/products.dart';

class INSCardsList extends StatefulWidget {
  const INSCardsList({
    Key key,
    this.title,
    this.more,
    this.press,
    this.listHeight,
    this.cat_id,
    this.cardWidth,
  }) : super(key: key);

  final double cardWidth;
  final String cat_id;
  final String title;
  final String more;
  final Function press;
  final double listHeight;

  @override
  _INSCardsListState createState() => _INSCardsListState();
}

class _INSCardsListState extends State<INSCardsList> {
  List<Product> contents = new List();

  @override
  void initState() {
    super.initState();

    Product.get((data) {
      setState(() {
        contents = data;
      });
    }, cat_id: widget.cat_id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: kDefaultPadding, bottom: kDefaultPadding),
          child: Row(
            children: <Widget>[
              (widget.title == null)
                  ? Text("")
                  : Text(
                      widget.title,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: INSDefultLebalColor),
                    ),
              Spacer(),
              (widget.more == null)
                  ? Text("")
                  : FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: kPrimaryColor,
                      onPressed: widget.press,
                      child: Text(
                        widget.more,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ],
          ),
        ),
        ListBody(
          contents: contents,
          listHeight: widget.listHeight,
          cardWidth: widget.cardWidth,
        )
      ],
    );
  }
}

class ListBody extends StatelessWidget {
  final double cardWidth;
  const ListBody({
    Key key,
    this.listHeight,
    this.contents,
    this.cardWidth,
  }) : super(key: key);

  final double listHeight;
  final List<Product> contents;
  @override
  Widget build(BuildContext context) {
    var cc = contents.length;
    return Container(
      height: (listHeight == null) ? INSListCardSHeight : listHeight,
      child: (contents.length < 2)
          ? Container()
          : ListView.builder(
              addAutomaticKeepAlives: false,
              itemCount: contents.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ItemCard(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaillsScreen(
                          product: contents[index],
                        ),
                      ),
                    );
                  },
                  cardWidth: cardWidth,
                  product: contents[index],
                  listCardDefultMargin: this.listHeight),
            ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Function press;
  final int index;
  final double cardWidth;
  final double listCardDefultMargin;
  final Product product;

  ItemCard(
      {this.index,
      this.product,
      this.press,
      this.listCardDefultMargin,
      this.cardWidth});
  double listCardDefultMargi = 5;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: this.cardWidth == null ? 150 : this.cardWidth,
        margin:
            const EdgeInsets.symmetric(horizontal: INSListCardDefultPadding),
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: INSListCardDefultBackground,
          borderRadius: BorderRadius.circular(INSListCardDefulteBorderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(INSListCardImageDefultPadding),
                  decoration: BoxDecoration(
                    color: Color(this.product.color),
                    borderRadius: BorderRadius.circular(
                        INSListCardDefultImageBorderRadius),
                  ),
                  child:

                      // _Homecategories[index].image

                      INSNet.getImage(this.product.image,
                          heroTag: this.product.id)),
            ),
            (this.product.title == null)
                ? Text("")
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefultpadding / 2,
                        horizontal: kDefultpadding / 2),
                    child: Text(
                      this.product.title,
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ),
            (this.product.price == null)
                ? Text("")
                : Padding(
                    padding: const EdgeInsets.only(
                        top: 0,
                        left: kDefultpadding / 2,
                        right: kDefultpadding / 2,
                        bottom: kDefultpadding),
                    child: Text(
                      "\$${this.product.price}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
