import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/app_components/screen_title.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/components/ins_cards_list.dart';
import 'package:shop_app/ins/ui/ina_inputs.dart';
import 'package:shop_app/models/Product.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
            decoration: BoxDecoration(
                color: Color(0xfff0eef0),
                borderRadius:
                    BorderRadius.all(Radius.circular(INSDefultRadius))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NewsArea(),
                SizedBox(height: 32),
                CategoriesArea(),
                SizedBox(height: 32),
                INSCardsList(
                  title: "Most poplery",
                  press: () => {},
                  listHeight: 200,
                  contents: products,
                ),
                SizedBox(height: 32),
                INSCardsList(
                  title: "New Porducts",
                  press: () => {},
                  listHeight: 400,
                  contents: products,
                ),
                SizedBox(height: 32),
                INSCardsList(title: "675", press: () => {}, contents: products),
                SizedBox(height: kDefultpadding),
              ],
            ),
          ),
        ],
      ),
    );
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

class CategoriesArea extends StatelessWidget {
  const CategoriesArea({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = 80;
    return Container(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: _width,
            padding: const EdgeInsets.all(4.0),
            child: Column(children: [
              Container(
                width: _width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(INSDefultRadius / 2),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    categories[index].image,
                    width: 40,
                    color: INSPrimaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  categories[index].title,
                  style: TextStyle(fontSize: 10),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
