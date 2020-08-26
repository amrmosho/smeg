import 'package:flutter/material.dart';
import 'package:shop_app/Screens/homeScreens/home/components/categories_list.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/app_components/search_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';

import 'package:shop_app/models/products.dart';
import 'package:shop_app/models/products_categories.dart';
import 'Item_card.dart';

class Body extends StatefulWidget {
  final ProductsCategories category;

  const Body(this.category, {Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

String _sub_id = "";
List<Product> _catdata = new List();
List<ProductsCategories> _Homecategories = new List();

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    _sub_id = widget.category.id;

    ProductsCategories.get(
        onDone: (data) {
          setState(() {
            _Homecategories = data;
          });
        },
        cat_id: widget.category.id);

    Product.get((data) {
      setState(() {
        _catdata = data;
      });
    }, cat_id: _sub_id);
  }

  TextEditingController _textFieldController = TextEditingController();
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
            textSearcController: _textFieldController,
            onChanged: (value) {
              Product.get((data) {
                setState(() {
                  _catdata = data;
                });
              }, cat_id: widget.category.id, title: value);
            },
            hint: INSLang.get("searchin") +
                " " +
                this.widget.category.title +
                " ....",
          ),
          CategoriesList(
              Homecategories: _Homecategories,
              sub_cat_id: _sub_id,
              onTap: (v) {
                Product.get((data) {
                  setState(() {
                    _catdata = data;
                    _sub_id = v.id;
                    _textFieldController.clear();
                  });
                }, cat_id: v.id);
              },
              cat_id: this.widget.category.id),
          CategoryMainItems(
            catdata: _catdata,
          )
        ],
      ),
    );
  }
}

class CategoryMainItems extends StatefulWidget {
  final List<Product> catdata;
  const CategoryMainItems({
    Key key,
    this.catdata,
  }) : super(key: key);

  @override
  _CategoryMainItemsState createState() => _CategoryMainItemsState();
}

class _CategoryMainItemsState extends State<CategoryMainItems> {
  List<Product> _catdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _catdata = widget.catdata;
  }

  ref(List<Product> catdata) {
    setState(() {
      _catdata = catdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefultpadding / 2),
        child: GridView.builder(
          itemCount: widget.catdata.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: kDefultpadding,
              crossAxisSpacing: kDefultpadding,
              crossAxisCount: 2,
              childAspectRatio: 0.75),
          itemBuilder: (context, index) => ItemCard(
              product: widget.catdata[index],
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetaillsScreen(
                      product: widget.catdata[index],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
