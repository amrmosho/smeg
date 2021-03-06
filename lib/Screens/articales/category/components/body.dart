import 'package:flutter/material.dart';
import 'package:Smeg/Screens/productScreens/details/details_screen.dart';
import 'package:Smeg/Screens/homeScreens/home/components/categories_list.dart';
import 'package:Smeg/app_components/search_bar.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/models/products.dart';
import 'Item_card.dart';

class Body extends StatefulWidget {
  final Product category;

  const Body(this.category, {Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> _catdata = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // INSData.getContentByCatID(products, widget.category.id);
    Product.get((data) {
      List<Product> _catdata = data;
    }, cat_id: widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: INSDefultpadding, horizontal: INSDefultpadding / 4),
      decoration: BoxDecoration(
          color: Color(0xfff0eef0),
          borderRadius: BorderRadius.all(Radius.circular(INSDefultRadius))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: INSDefultpadding / 2),
          SearchBar(
            hint:
                INSLang.get("searchin") + this.widget.category.title + " ....",
          ),
          CategoriesList(cat_id: this.widget.category.id),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefultpadding / 2),
              child: GridView.builder(
                itemCount: _catdata.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: kDefultpadding,
                    crossAxisSpacing: kDefultpadding,
                    crossAxisCount: 2,
                    childAspectRatio: 0.75),
                itemBuilder: (context, index) => ItemCard(
                    product: _catdata[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetaillsScreen(
                            product: _catdata[index],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
