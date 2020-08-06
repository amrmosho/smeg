import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/Screens/productScreens/category/category.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';

import 'package:shop_app/constants.dart';

class CategoriesList extends StatelessWidget {
  final int cat_id;
  const CategoriesList({Key key, this.cat_id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Content> _Homecategories =
        INSData.getContentByCatID(categories, cat_id);

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
                          child: SvgPicture.asset(
                            _Homecategories[index].image,
                            width: 40,
                            color: INSPrimaryColor,
                          ),
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
