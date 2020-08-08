import 'package:flutter/material.dart';
import 'package:shop_app/Screens/homeScreens/home/components/categories_list.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/components/ins_cards_list.dart';
import 'package:shop_app/ins/ui/ina_inputs.dart';
import 'package:shop_app/models/news.dart';
import 'package:shop_app/models/products_categories.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<ProductsCategories> _Homecategories = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ProductsCategories.get(onDone: (data) {
      setState(() {
        _Homecategories = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
            padding: EdgeInsets.only(
              top: INSDefultpadding,
              bottom: INSDefultpadding * 2,
              right: INSDefultpadding / 4,
              left: INSDefultpadding / 4,
            ),
            decoration: BoxDecoration(
                color: Color(0xfff0eef0),
                borderRadius:
                    BorderRadius.all(Radius.circular(INSDefultRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsArea(),
                CategoriesList(
                  cat_id: "0",
                ),
                buildInsCardsListData(8, 200, 150),
                SizedBox(height: 32),
                buildInsCardsListData(9, 400, 300),
                SizedBox(height: 32),
                buildInsCardsListData(10, 200, 150),
                SizedBox(height: kDefultpadding),
              ],
            ),
          ),
        ],
      ),
    );
  }

  INSCardsList buildInsCardsListData(
      int catid, double height, double cardWidth) {
    List<ProductsCategories> data =
        _Homecategories.where((l) => l.id.contains(catid.toString())).toList();

    return INSCardsList(
        title: data[0].title,
        press: () => {},
        listHeight: height,
        cardWidth: cardWidth,
        cat_id: catid.toString());
  }
}

class NewsArea extends StatelessWidget {
  const NewsArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width - 16;
    return Container(
      padding: const EdgeInsets.all(0),
      height: _width / 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Container(
            width: _width,
            padding: const EdgeInsets.all(8.0),
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(INSDefultRadius),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(INSBTNBorderRaduus),
                  child: Image.asset(
                    news[index].image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
