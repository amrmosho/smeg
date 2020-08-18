import 'package:flutter/material.dart';
import 'package:shop_app/Screens/articales/category/category.dart';
import 'package:shop_app/Screens/homeScreens/home/components/categories_list.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/components/ins_cards_list.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/ins/ui/ina_inputs.dart';
import 'package:shop_app/models/content.dart';
import 'package:shop_app/models/products_categories.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<ProductsCategories> _Homecategories = new List();
  List<Widget> _news = new List();

  @override
  void initState() {
    super.initState();

/*
http://smeg.sys4me.com/insapi/insert/sys_html/title/ffff/
*/
/*
    var resBody = <String, String>{
      'title': "xxxxxxxxxxxxxxx",
    };

    INSNet.getJsone(
        addToUrl: "/insert/sys_html/",
        data: resBody,
        onDone: (data) {
          print(data);
        });*/

    ProductsCategories.get(onDone: (data) {
      setState(() {
        _Homecategories = data;
      });
    });

    Content.get((data) {
      setState(() {
        List<Content> d = data;
        _news.clear();
        for (var i = 0; i < d.length; i++) {
          _news.add(new_img(d[i]));
        }
      });
    });
  }

  Widget new_img(Content c) {
    double _width = MediaQuery.of(context).size.width - 16;
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
              child: INSNet.getImage(c.image, padding: 0, fit: BoxFit.fill)),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                NewsArea(
                  news: _news,
                ),
                CategoriesList(
                  onTap: (v) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategoryScreen(v)),
                    );
                  },
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

class NewsArea extends StatefulWidget {
  final List<Widget> news;

  const NewsArea({
    Key key,
    this.news,
  }) : super(key: key);

  @override
  _NewsAreaState createState() => _NewsAreaState();
}

class _NewsAreaState extends State<NewsArea> {
  List<Widget> dash = List();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    dash.clear();
    for (var i = 0; i < this.widget.news.length; i++) {
      dash.add(Container(
        height: 5,
        width: (currentPage == i) ? 40 : 20,
        margin: EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: (currentPage == i) ? Colors.white : INSPrimaryColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3))
          ],
        ),
      ));
    }

    double _width = MediaQuery.of(context).size.width - 16;
    return Container(
      padding: const EdgeInsets.all(0),
      height: _width / 2,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          scrollDirection: Axis.horizontal,
          itemCount: widget.news.length,
          itemBuilder: (context, index) {
            return widget.news[index];
          },
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          height: 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: dash,
          ),
        ),
      ]),
    );
  }
}
