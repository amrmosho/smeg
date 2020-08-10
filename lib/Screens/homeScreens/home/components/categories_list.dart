import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/category/category.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/products_categories.dart';

class CategoriesList extends StatefulWidget {
  final String cat_id;
  final String sub_cat_id;

  final Function onTap;
  final List<ProductsCategories> Homecategories;

  const CategoriesList(
      {Key key, this.cat_id, this.onTap, this.Homecategories, this.sub_cat_id})
      : super(key: key);

  @override
  _CategoriesListState createState() =>
      _CategoriesListState(cat_id: cat_id, onTap: onTap);
}

class _CategoriesListState extends State<CategoriesList> {
  List<ProductsCategories> _Homecategories = new List();
  final String cat_id;
  final Function onTap;

  _CategoriesListState({this.cat_id, this.onTap});

  @override
  void initState() {
    super.initState();

    if (widget.Homecategories == null) {
      ProductsCategories.get(
          onDone: (data) {
            setState(() {
              _Homecategories = data;
            });
          },
          cat_id: this.cat_id);
    } else {
      _Homecategories = widget.Homecategories;
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = 78;
    return _Homecategories.length == 0
        ? Container(height: 0)
        : Container(
            padding: EdgeInsets.all(8),
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _Homecategories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: _width,
                  padding: const EdgeInsets.all(4.0),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        if (onTap != null) onTap(_Homecategories[index]);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: _width,
                        decoration:
                            (widget.sub_cat_id == _Homecategories[index].id)
                                ? BoxDecoration(
                                    color: Colors.white,
                                  )
                                : BoxDecoration(
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
                            child: INSNet.getImage(_Homecategories[index].image,
                                height: 55, padding: 4)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _Homecategories[index].title,
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
