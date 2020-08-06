import 'package:flutter/material.dart';
import 'package:shop_app/Screens/productScreens/details/details_screen.dart';
import 'package:shop_app/Screens/homeScreens/home/components/categories_list.dart';
import 'package:shop_app/app_components/search_bar.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/data_types.dart';
import 'package:shop_app/models/Product.dart';
import 'Item_card.dart';

class Body extends StatelessWidget {
  final Content category;

  const Body(this.category, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Content> _catdata = INSData.getContentByCatID(products, category.id);

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
            hint: " Search in " + this.category.title + " ....",
          ),
          CategoriesList(cat_id: this.category.id),
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
