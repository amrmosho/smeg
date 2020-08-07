import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/productScreens/category/category.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/models/Product.dart';

import 'package:shop_app/constants.dart';
import 'package:shop_app/models/products_categories.dart';

class CategoriesList extends StatefulWidget {
  final int cat_id;
  const CategoriesList({Key key, this.cat_id}) : super(key: key);

  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<ProductsCategories> _Homecategories = new List();

  @override
  void initState() {
    super.initState();
    ProductsCategories.get((data) {
      setState(() {
        _Homecategories = data;
      });
    });
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryScreen(_Homecategories[index])),
                        );
                      },
                      child: Container(
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
                          child: FutureBuilder(
                            future:
                                INSNet.get_image(_Homecategories[index].image),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return Image.file(snapshot.data);
                              } else {
                                return CircularProgressIndicator();
                              }
                            },

                            // Image.file(_file)
                          ),
                          /* child: SvgPicture.asset(
                            _Homecategories[index].image,
                            width: 40,
                            color: INSPrimaryColor,
                          ),*/
                        ),
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
